# State Management

This document defines the state management approach used in the Habit Tracker app.

## Current Direction
- Riverpod is the primary state management solution
- Prefer `Notifier` and `AsyncNotifier`
- Avoid `setState` for business logic

## Notes
- Keep providers feature scoped where possible
- Use `AsyncValue` correctly for loading and error states
