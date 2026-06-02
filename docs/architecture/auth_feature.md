# Authentication Feature Architecture & Design

## Overview

This document outlines the architectural design and structural decisions behind the **Authentication Feature** in the HABITS application. Designed by the senior architecture team, this module adheres strictly to the principles of **Clean Architecture**, **MVVM (Model-View-ViewModel)**, and **Riverpod** state management, ensuring decoupled code, testability, and future scalability.

---

## 1. Directory Structure

The feature resides in `features/auth/` and is divided into three distinct layers as mandated by Clean Architecture:

```text
lib/features/auth/
├── data/
│   ├── datasources/
│   │   └── auth_remote_datasource.dart    # Abstract contract & stub remote implementation
│   ├── mappers/
│   │   └── user_mapper.dart               # Maps UserModel <-> UserEntity
│   ├── models/
│   │   └── user_model.dart                # Raw user data model (serialization support)
│   └── repositories/
│       └── auth_repository_impl.dart      # Implements domain repository contract
├── domain/
│   ├── entities/
│   │   └── user_entity.dart               # Pure Dart entity representing the user
│   ├── repositories/
│   │   └── auth_repository.dart           # Contract repository boundary
│   └── usecases/
│       ├── get_current_user.dart          # Gets active session user
│       ├── sign_in.dart                   # Sign in with email & password
│       ├── sign_out.dart                  # Sign out active session
│       └── sign_up.dart                   # Sign up with email, password & name
└── presentation/
    ├── pages/
    │   ├── sign_in_page.dart              # Responsive composition sign-in page
    │   └── sign_up_page.dart              # Responsive composition sign-up page
    ├── providers/
    │   └── auth_providers.dart            # Di & Riverpod providers definition
    ├── viewmodels/
    │   └── auth_viewmodel.dart            # Main VM managing auth logic and state transitions
    └── widgets/
        ├── auth_sign_in_form.dart         # Extracted Sign In Form logic
        ├── auth_sign_up_form.dart         # Extracted Sign Up Form logic
        └── auth_text_field.dart           # Reusable custom brutalist input field
```

---

## 2. Architecture & Data Flow

The authentication feature enforces a strict unilateral data flow. Layers are fully decoupled; no layer knows about the inner workings of downstream layers.

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
             Firebase Auth (Future)
```

### Unilateral Authentication Flow
1. **User Interaction**: The user enters their credentials in `AuthSignInForm` and taps the sign-in button.
2. **Form Validation**: The widget validates the form inputs. If valid, it calls the `signIn` method on `authViewModelProvider.notifier`.
3. **ViewModel Execution**: `AuthViewModel` transitions its state to `AsyncValue.loading()`, indicating to the UI that a request is pending. It then invokes the `SignIn` use case.
4. **Use Case Business Logic**: The `SignIn` use case invokes `signIn` on the `AuthRepository` contract.
5. **Repository Orchestration**: `AuthRepositoryImpl` calls `AuthRemoteDataSource` to execute the remote transaction. It receives a `UserModel` from the source and maps it back to a pure `UserEntity` using `UserMapper.toEntity`.
6. **Data Source Execution**: `AuthRemoteDataSourceImpl` performs the actual API request to the network/Firebase and returns a `UserModel` on success, or throws an exception on failure.
7. **State Progression**:
    - **On Success**: The ViewModel sets the state to `AsyncValue.data(user)`. GoRouter listens to `authViewModelProvider` changes and automatically redirects the user to the dashboard `/`.
    - **On Failure**: The ViewModel catches the exception, updating the state to `AsyncValue.error(error)`. The UI page listens to the state change and displays the error via a SnackBar.

---

## 3. State Management Decisions

### Why `AsyncNotifier` Was Selected

Rather than managing state using complex custom union state definitions (e.g., loading/error/data helper classes), we use Riverpod’s **`AsyncNotifier`** and its reactive state model **`AsyncValue`** for the following architectural benefits:

1. **State Safety**: `AsyncValue` enforces the handling of all possible async states (`loading`, `error`, and `data`) natively. The UI views can securely bind their render state without missing edge cases.
2. **Minimal Boilerplate**: The standard async states are automatically caught and set using `AsyncValue.guard(...)` or manual try-catch wrappers, eliminating custom state subclasses.
3. **Seamless Loading/Error Lifecycle**: State transitions from `loading` to `error` or `data` automatically trigger updates. Listening to the state in the router or screen via `ref.listen` allows instant reaction to errors (e.g., showing SnackBars) or authentication changes (e.g., routing redirection).
4. **Compile-time Safe DI**: Declaring the repositories and data sources as global providers in `auth_providers.dart` lets Riverpod compile-check dependencies. Mocking repository instances during tests becomes as simple as overriding a provider.

---

## 4. Integration Plan: Firebase Authentication

The current data layer implementation acts as a contract boundary, throwing `UnimplementedError()` for remote data source methods. When the team is ready to connect Firebase, the integration is completely localized to the data layer:

### Steps to Integrate Firebase
1. **Add Dependency**: Add `firebase_auth` to `dependencies` in `pubspec.yaml`.
2. **Configure Data Source**: Initialize a `FirebaseAuth` instance in `AuthRemoteDataSourceImpl`.
3. **Implement Sign-In**:
   ```dart
   @override
   Future<UserModel?> signIn({required String email, required String password}) async {
     try {
       final credential = await _firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );
       final firebaseUser = credential.user;
       if (firebaseUser == null) return null;
       
       return UserModel(
         id: firebaseUser.uid,
         email: firebaseUser.email ?? email,
         fullName: firebaseUser.displayName ?? '',
         createdAt: firebaseUser.metadata.creationTime,
       );
     } on firebase_auth.FirebaseAuthException catch (e) {
       throw Exception(e.message ?? 'An unknown error occurred during sign-in.');
     }
   }
   ```
4. **Implement Sign-Up**:
   ```dart
   @override
   Future<UserModel?> signUp({
     required String email,
     required String password,
     required String fullName,
   }) async {
     try {
       final credential = await _firebaseAuth.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );
       final firebaseUser = credential.user;
       if (firebaseUser == null) return null;

       // Update the display name profile in Firebase
       await firebaseUser.updateDisplayName(fullName);
       
       return UserModel(
         id: firebaseUser.uid,
         email: firebaseUser.email ?? email,
         fullName: fullName,
         createdAt: firebaseUser.metadata.creationTime,
       );
     } on firebase_auth.FirebaseAuthException catch (e) {
       throw Exception(e.message ?? 'An unknown error occurred during sign-up.');
     }
   }
   ```
5. **Implement Sign-Out & Session Check**:
   Implement `signOut()` to call `_firebaseAuth.signOut()`, and `getCurrentUser()` to inspect `_firebaseAuth.currentUser`.

> Since use cases and UI components bind strictly to the generic `AuthRepository` interface, changing the remote data source implementation requires absolutely zero changes in the domain, presentation, or routing layers.

---

## 5. Architectural Scalability

1. **Strict Decoupling**: ViewModels talk only to use cases, never directly to repositories or data sources. This allows modifying network fetching behavior without breaking UI widgets.
2. **Feature Isolation**: By confining authentication within `lib/features/auth`, any subsequent features (e.g. habit synchronizations, social sharing) can consume auth state by simply watching `authViewModelProvider` without tight coupling.
3. **Testing Support**: Because all dependencies are injected via Riverpod providers, writing mock tests is straightforward:
   - For UI tests: Override `authViewModelProvider` with a mock notifier.
   - For ViewModel tests: Override `authRepositoryProvider` with a mock repository.
   - For Repository tests: Override `authRemoteDataSourceProvider` with a mock data source.
4. **Responsive Integrity**: Form dimensions and page structures are governed by `ResponsiveBuilder` constraints, ensuring layouts scale from narrow mobile views to full widescreen desktop monitors without code duplication.
