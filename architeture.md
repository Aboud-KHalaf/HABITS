# Flutter Architecture & Implementation Plan: HABITS Tracker

As a senior Flutter developer, I've outlined a robust, scalable architecture for the **HABITS** project. Given the Neo-Brutalist design language and the data-heavy nature of habit tracking (streaks, heatmaps, analytics), we need an architecture that prioritizes clean state management and efficient UI rendering.

## 1. Architecture: Clean Architecture + Feature-First (Hybrid)
We use a **Hybrid approach** combining:
- **Global**: Domain layer (entities, repository interfaces) + Core (theme, database)
- **Feature-specific**: Each feature has its own data layer (datasource, repository impl)

### Layers:
- **Core:** Shared infrastructure (Theme, Database, Utils, Widgets)
- **Domain:** Business logic, Entities (Habit, Entry, Streak), and Repository interfaces
- **Features:** Each feature has its own Data (Repository impl, DataSource) + Presentation
- **Presentation:** UI Widgets and State Management (Riverpod)

## 2. Folder Structure
```text
lib/
├── core/                        # Shared infrastructure
│   ├── database/                # Hive CE service + models (shared)
│   │   ├── hive_service.dart
│   │   └── models/
│   │       ├── habit_model.dart + .g.dart
│   │       └── entry_model.dart + .g.dart
│   ├── theme/                   # Neo-Brutalist theme (Space Grotesk, Borders)
│   ├── widgets/                 # Shared Brutalist components (Buttons, Cards)
│   └── utils/                   # Date helpers, streak calculation logic
│
├── domain/                      # Global (shared types - NO Flutter deps)
│   ├── entities/                # Habit, Entry, Streak
│   └── repositories/            # Abstract interfaces
│
├── features/                    # Feature-based modules
│   ├── dashboard/
│   │   ├── data/                # DashboardRepositoryImpl, DataSource, Mappers
│   │   └── presentation/        # UI screens, widgets, providers
│   ├── habit_creation/
│   │   ├── data/
│   │   └── presentation/
│   ├── analytics/
│   │   ├── data/
│   │   └── presentation/
│   ├── calendar/
│   │   ├── data/
│   │   └── presentation/
│   └── settings/
│       ├── data/
│       └── presentation/
│
└── main.dart                    # Entry point & DI setup
```

## 3. Recommended Dependencies

- **State Management:** `flutter_riverpod` or `bloc`. Riverpod recommended for local data streams.
- **Local Database:** `hive` CE (NoSQL) - works on mobile + web (IndexedDB)
- **Charts/Graphs:** `fl_chart` for vertical bar charts in Analytics
- **Typography:** `google_fonts` (Space Grotesk)
- **Icons:** `material_design_icons_flutter` or `flutter_svg`
- **Date Handling:** `table_calendar` (customized for Brutalist style) + `intl`

## 4. State Management Strategy: Riverpod

For **HABITS**, reactive updates across Dashboard, Analytics, and Calendar simultaneously.

- **Providers:** Use `StreamProvider` to listen to Hive boxes. When a user marks habit "Done", all views update instantly.
- **Logic:** Streak calculations reside in Repository implementation (called by Providers).

## 5. UI Implementation (Brutalist Specs)

- **Borders:** Global `BoxDecoration` with `border: Border.all(width: 4)` and hard-edge shadows
- **Theming:** Leverage `ThemeData` extensions for Primary Dark Mode (#131313) + high-intensity accents
- **Shape:** Zero rounded corners (border-radius: 0) - strictly orthogonal
- **Elevation:** Hard-edge colored shadows (no blur), 4px-8px offset

This setup ensures the technical foundation is as disciplined and high-performance as the UI itself.