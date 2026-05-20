# AI Agent Rules — Habit Tracker App

## Project Architecture

This project follows:

- Clean Architecture
- MVVM
- Feature First Structure
- Riverpod (Notifier/AsyncNotifier)
- Hive CE for local storage

The architecture must remain scalable, modular, and maintainable.

---

# Folder Structure

lib/
│
├── core/
├── features/
├── shared/
├── app/
└── main.dart

---

# Feature Structure

Each feature must follow:

features/feature_name/
│
├── data/
├── domain/
└── presentation/

---

# Data Layer Rules

The data layer may contain:

- models
- datasources
- repository implementations
- mappers

Rules:

- Models must never be used directly in UI.
- Hive access is only allowed inside datasources.
- Repository implementations belong only in data layer.

---

# Domain Layer Rules

The domain layer contains:

- entities
- repository contracts
- use cases

Rules:

- Domain layer must not depend on Flutter.
- Entities must remain pure.
- Use cases contain business logic.
- UI must communicate with use cases only through ViewModels.

---

# Presentation Layer Rules

The presentation layer contains:

- pages
- widgets
- viewmodels
- providers
- states

Rules:

- Business logic is forbidden inside widgets.
- Widgets must remain as dumb as possible.
- ViewModels handle state management.
- Riverpod is the only allowed state management solution.

---

# Riverpod Rules

Allowed:

- NotifierProvider
- AsyncNotifierProvider

Avoid:

- setState
- Provider package
- global mutable states

Rules:

- One ViewModel per screen when appropriate.
- AsyncValue must be handled properly.
- Providers must remain feature scoped unless global behavior is needed.

---

# Hive Rules

Allowed Hive boxes:

- habits_box
- habit_completions_box
- settings_box

Rules:

- Never access Hive directly from UI.
- Hive adapters must live inside core/database.
- Separate Habit from HabitCompletion.

---

# Habit Architecture

Habit entity represents habit definition only.

HabitCompletion represents completion history.

Never store completion state directly inside Habit.

---

# Notification Rules

Notifications must be managed only through:

core/notifications/

Rules:

- Notifications must support background execution.
- Notifications must survive app restarts.
- Notification scheduling must happen through services.
- UI must never schedule notifications directly.

---

# Naming Conventions

Files:

- snake_case.dart

Classes:

- PascalCase

Providers:

- suffix with Provider

ViewModels:

- suffix with ViewModel

UseCases:

- action based naming

Examples:

- create_habit.dart
- get_today_habits.dart

---

# Forbidden Patterns

DO NOT:

- Access Hive from widgets
- Place business logic inside UI
- Use setState
- Bypass use cases
- Mix entities with models
- Create huge widgets
- Create God classes
- Hardcode theme values
- Duplicate business logic

---

# Clean Architecture Flow

UI
↓
ViewModel
↓
UseCase
↓
Repository
↓
Datasource
↓
Hive

Never bypass this flow.

---

# Project Goal

The goal of this project is:

- Production-level architecture
- Scalable Flutter structure
- Advanced Riverpod usage
- Professional notification system
- Maintainable codebase
- Clean separation of concerns