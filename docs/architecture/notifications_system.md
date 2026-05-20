# Notifications System

This document defines the notification architecture for the Habit Tracker app.

## Rules
- Notifications must be managed through services
- UI must not schedule notifications directly
- Support background execution and app restarts

## Notes
- Document scheduling, cancelation, and update flows here
- Keep notification logic isolated from presentation code
