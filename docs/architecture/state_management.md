# State Management Architecture & Philosophy

## Overview
This document serves as an educational and technical manifesto on how State Management is structurally handled in the HABITS app. 

The architecture strictly adheres to **Clean Architecture**, **MVVM**, and **Riverpod** standards. Above all, it optimizes for predictability, explicit state transitions, feature isolation, and long-term maintainability.

---

## 1. Why Riverpod Was Selected

Riverpod sits at the core of our presentation layer for several reasons:

- **Compile-time Safety**: Unlike the older `provider` package, Riverpod does not rely on the Widget tree for dependency resolution. Missing providers are caught at compile-time rather than throwing `ProviderNotFoundException` at runtime.
- **Dependency Injection**: Riverpod inherently acts as a robust IoC (Inversion of Control) container. We use it to inject Use Cases, Repositories, and DataSources without bloated setup code.
- **Scalability**: By organizing Providers tightly around domains and features, the application can grow seamlessly. We can compose state logic or chain dependencies predictably.
- **Testability**: Overriding providers during testing is a first-class feature of Riverpod, ensuring our ViewModels and use cases are thoroughly testable without needing heavy mocking frameworks across the widget tree.

---

## 2. Why AsyncNotifier Was Used

In a production-level application, state is rarely deterministic and synchronous. Local database reads (Hive), analytics computation, or external data fetching all resolve asynchronously.

**Why `AsyncNotifier` over `StateNotifier`?**
- `StateNotifier` requires you to manually define and emit "Loading", "Error", and "Success" sub-states (e.g., via a Freezed union or sealed class).
- `AsyncNotifier` (and its counterpart `AsyncValue`) natively encapsulates these states. 
- It reduces boilerplate immensely. A ViewModel extending `AsyncNotifier` inherently provides `AsyncLoading`, `AsyncData`, and `AsyncError`. The UI only needs to `ref.watch(viewModelProvider).when(...)` to render these states securely.

---

## 3. How MVVM Was Applied

We employ the **Model-View-ViewModel (MVVM)** pattern to enforce a rigid separation of concerns.

- **View (Widgets)**: Strictly presentational. Widgets must remain "dumb." They contain absolutely NO business logic. They do two things: 1) Watch ViewModels for state updates. 2) Send user intention (button clicks, form submits) to ViewModels.
- **ViewModel (Riverpod Notifiers)**: The "brain" of the UI feature. ViewModels observe domain states, call UseCases, parse errors, and expose reactive state that widgets can listen to.
- **Model**: The domain entities and state classes representing raw data. 

**Why must widgets remain dumb?** 
If business logic leaks into Widgets, testing becomes incredibly slow (requiring widget tests instead of unit tests), and logic reuse across multiple UI surfaces becomes impossible. Building small, dumb widgets minimizes technical debt.

---

## 4. How State Flows Through The App

The flow is strictly unilateral (one-way).

```text
UI  -> Sends Intent  -> ViewModel
                        ↓
                     UseCase
                        ↓
               Repository Contract
                        ↓
           Repository Implementation
                        ↓
                 Datasource
                        ↓
                   Hive CE
```

**Why this exact separation exists:**
- **ViewModel to UseCase**: The ViewModel doesn't care HOW a habit is saved. It just asks the UseCase `createHabit.call()`.
- **UseCase to Repository**: The UseCase enforces business rules. It asks the generic repository to perform an action.
- **Repository to Datasource**: The Repository converts Entities to Models and isolates the application from the underlying storage mechanism.
- **Datasource to Hive**: If we ever swap Hive for SQLite, Isar, or a Remote DB, only the Datasource changes. The ViewModel, UI, and UseCases remain completely untouched.

---

## 5. Scalability Decisions

- **Feature Isolation**: By grouping ViewModels, Providers, and States closely within `features/habits/presentation`, we avoid the "monolith module" problem. If the Analytics feature is added tomorrow, it won't step on the Habit feature's toes.
- **Future Integration**: Using immutable state objects and `AsyncValue` perfectly positions us to integrate a calendar view or cloud sync. Since state flows downwards deterministically, background updates just require the ViewModel to call `ref.invalidateSelf()` or manually update the state with new UseCase data, and UI reactively paints.

---

## 6. Why Certain Alternatives Were Rejected

- **Why not the Provider package?** It relies heavily on `InheritedWidget`. Moving widgets alters provider availability. Riverpod declares providers globally, resolving them cleanly via `ref`.
- **Why not setState?** Ephemeral UI state (e.g., a simple toggle animation) can use `setState`. But domain state, data loads, and form processing should never live in `setState`. It destroys readability, creates massive widgets, and makes state sharing unmanageable.
- **Why not direct Hive access in UI?** Passing `Hive.box` directly to the UI marries the app's View layer to a specific database technology. This creates an unmaintainable codebase that cannot easily be pivoted, mocked, or unit-tested.

---

## 7. How Professional Flutter Engineers Think

Engineering goes beyond getting the app to compile. It's about designing a system that someone else can safely modify six months from now without breaking everything.

**Core Tenets of a Professional Architect:**
1. **Reduce Tight Coupling**: If Layer A intimately knows how Layer B works, you have failed. The ViewModel should not know that Hive exists. The UI should not know that a Repository exists.
2. **Predictable Data**: Minimize hidden side-effects. Use `final` everywhere. Immutable state protects against unpredictable race conditions during complex UI transitions.
3. **Explicit over Implicit**: Explicitly declaring use cases makes feature requirements instantly understandable to new developers. You don't have to read 500 lines of UI code to deduce what a screen does.
4. **Assume Growth**: Always assume your feature will expand 10x in complexity. By establishing strict `UI -> ViewModel -> UseCase -> Repo -> DB` pipelines now, adding complex rules (e.g., "cannot save habit if daily limit is reached") becomes trivial because a dedicated architectural layer exists to handle it natively.
