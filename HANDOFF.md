# HABITS Tracker - Developer Handoff

## Project Goal
High-performance habit-tracking Flutter application with Neo-Brutalist V2 aesthetic. A "command center" for self-discipline featuring daily habits, weekly scheduling, streak tracking, 90-day heatmap analytics, and monthly calendar view.

---

## Current Progress

### ✅ Completed
1. **Theme Module** (`lib/core/theme/`)
   - `app_colors.dart` - All design system colors
   - `app_typography.dart` - Space Grotesk text styles
   - `app_spacing.dart` - Spacing constants (4px grid)
   - `app_theme.dart` - Complete `ThemeData` with brutalist styling
   - No rounded corners (border-radius: 0)

2. **Core Database** (`lib/core/database/`)
   - Hive CE with manual adapters (typeId: 0=Habit, 1=Entry)
   - Cross-platform: works on mobile + web (IndexedDB)
   - `hive_service.dart` - Initialization and box access

3. **Domain Layer** (`lib/core/domain/`)
   - Entities: `Habit`, `Entry`, `Streak` (shared across features)
   - Repository interface: `HabitRepository`

4. **Dashboard Feature** (`lib/features/dashboard/data/`)
   - `dashboard_local_datasource.dart` - Hive CRUD operations
   - `dashboard_repository_impl.dart` - Implementation + streak logic
   - `mappers.dart` - Entity <-> Model mappers

### ⏳ In Progress
- **Presentation layer** - Not started
- **State management** - Not implemented
- **UI screens** - Dashboard, Calendar, Analytics, Settings, Habit Creation

---

## Architecture Decisions

| Layer | Implementation |
|-------|-----------------|
| **Architecture** | Clean Architecture + Feature-First (Hybrid) |
| **State Management** | Riverpod (recommended, not yet implemented) |
| **Local Storage** | Hive CE (NoSQL, works on web) |
| **UI Framework** | Material 3 with heavy custom theming |

### Folder Structure (Current)
```
lib/
├── core/
│   ├── database/               # Shared Hive service + models
│   │   ├── hive_service.dart
│   │   └── models/
│   ├── theme/                  # Design system
│   ├── widgets/                # Shared brutalist components (empty)
│   └── utils/                  # Date helpers, streak logic (empty)
│
├── core/domain/                # GLOBAL (shared types, NO Flutter deps)
│   ├── entities/               # Habit, Entry, Streak
│   └── repositories/           # Abstract interfaces
│
├── features/
│   ├── dashboard/
│   │   ├── data/               # Feature-specific impl
│   │   └── presentation/       # (empty - for UI)
│   ├── habit_creation/
│   ├── analytics/
│   ├── calendar/
│   └── settings/
│
└── main.dart
```

---

## Tech Stack

- **Flutter**: 3.10.7+
- **State**: flutter_riverpod (not yet added to pubspec)
- **Database**: hive ^2.2.3, hive_flutter ^1.1.0
- **Fonts**: google_fonts ^6.2.1 (Space Grotesk)
- **Utilities**: path_provider ^2.1.4

---

## Important Rules & Conventions

1. **Neo-Brutalist Design Rules**
   - No rounded corners (border-radius: 0 everywhere)
   - 4px hard-edge shadows (no blur)
   - Heavy borders: 3px (thin) / 6px (thick)
   - Colors: Primary = Neon Yellow (#eaea00), Secondary = Electric Green (#13ff43)
   - Text: Uppercase headlines, Space Grotesk

2. **Code Conventions**
   - Entities in `core/domain/entities/` (shared)
   - Repository interface in `core/domain/repositories/`
   - Feature data in `features/{feature}/data/`
   - Model + adapter in `core/database/models/`

3. **Pattern**
   - Domain layer has NO Flutter dependencies
   - Data layer maps between Models and Entities
   - Presentation uses Repository (not DataSource directly)
   - Each feature has its own repository implementation

---

## Problems Encountered

| Problem | Status |
|---------|--------|
| Flutter CLI not in PATH | Could not run `flutter pub get` - run manually |
| Hive adapters require code generation | Created manual `.g.dart` files to avoid build_runner |

---

## Fixes Attempted

1. **Manual Hive Adapters** - Wrote `habit_model.g.dart` and `entry_model.g.dart` manually to avoid `build_runner` dependency.
2. **Theme Extensions** - Added `AppThemeExtensions` on `ThemeData` for quick access to neo colors and borders.
3. **Restructured to Hybrid** - Domain global, feature-specific data layer.

---

## Remaining Tasks

### High Priority
1. Add `flutter_riverpod` to pubspec.yaml
2. Implement **Dashboard feature** (presentation layer):
   - Dashboard screen with today's habits
   - Habit card widget with "Mark Done" toggle
   - Streak display
3. Implement **Habit Creation feature**:
   - Create habit form
   - Weekly day picker (MWF style)
   - Color picker

### Medium Priority
4. **Calendar feature** - Monthly view with entries
5. **Analytics feature** - 90-day heatmap, weekly bar charts
6. **Settings feature** - Dark/light toggle, data export

### Low Priority
7. Push notifications / reminders
8. Data sync (future)

---

## Next Recommended Step

**Implement Dashboard Presentation Layer**

1. Add `flutter_riverpod: ^2.5.1` to `pubspec.yaml`
2. Create dashboard providers (habits for today, toggle completion)
3. Build `dashboard_screen.dart` with Neo-Brutalist cards
4. Test data flow: UI → Provider → Repository → Hive

**Key file to modify next:**
- `pubspec.yaml` - Add riverpod
- `lib/features/dashboard/presentation/` - Add UI code

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `lib/core/theme/theme.dart` | Export barrel for all theme items |
| `lib/core/database/hive_service.dart` | Database initialization |
| `lib/core/database/models/habit_model.dart` | Hive model for Habit |
| `lib/features/dashboard/data/dashboard_local_datasource.dart` | All Hive CRUD operations |
| `lib/features/dashboard/data/dashboard_repository_impl.dart` | Repository + streak logic |
| `lib/core/domain/entities/habit.dart` | Habit entity with `isScheduledForDay()` |
| `UI/habits_neo_brutalist_v2/DESIGN.md` | Full design specification |