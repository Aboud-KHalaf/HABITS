# HABITS — Project Overview

## Project Identity

HABITS is a production-level habit tracking application built with Flutter using a modern scalable architecture focused on long-term maintainability, performance, and clean separation of concerns.

The application combines:

- Clean Architecture
- MVVM
- Riverpod
- Hive CE
- Advanced Local Notifications

The project is intentionally designed as a learning-focused professional codebase to master:

- Scalable Flutter architecture
- Professional state management
- Feature-first organization
- Local persistence
- Notification systems
- Advanced UI implementation
- Analytics visualization

---

# Project Vision

HABITS is not designed as a casual productivity app.

The product philosophy is:

- Direct
- Disciplined
- Minimal distraction
- High signal-to-noise ratio
- Fast interaction loops
- Clear visual accountability

The application should feel:

- Bold
- Industrial
- Structured
- Intentional
- Data-oriented

The UX should prioritize clarity and execution over decoration.

---

# Design Language — Neo-Brutalist V2

## Visual Style

The application follows a Neo-Brutalist design system:

- Strong visual hierarchy
- Thick 4px borders
- Sharp shadows and offsets
- Minimal rounded corners
- High contrast layouts
- Raw and unapologetic UI composition

The interface should feel mechanical, disciplined, and tactile.

---

## Typography

Primary fonts:

- Space Grotesk
- Monospace fonts for analytics and metrics

Typography rules:

- Large bold headers
- Dense numerical presentation
- Clear hierarchy between labels and data
- Minimal decorative text

---

## Color System

Primary dark surface:

- `#131313`

Accent colors:

- Electric Blue
- Neon Green
- High-intensity status colors

Usage rules:

- Accent colors indicate interaction or status only
- Avoid excessive gradients
- Avoid soft pastel palettes
- Maintain high readability and contrast

---

# Core Features

---

# 1. Habit Dashboard

The dashboard acts as the user's daily mission control.

Responsibilities:

- Show today's habits
- Separate completed vs pending habits
- Provide quick completion interaction
- Display streak information
- Present actionable daily focus

Key interactions:

- One-tap completion
- Strike-through completed states
- Immediate visual feedback
- Fast state updates

---

# 2. Habit Creation & Scheduling

Users can create habits with advanced scheduling behavior.

Habit fields:

- Habit name
- Icon
- Frequency
- Weekly schedule
- Reminder time (optional)
- Notes (optional)

Supported scheduling modes:

## Daily Habits

Recurring every day.

## Weekly Habits

Custom day selection:

- Monday
- Tuesday
- Wednesday
- Thursday
- Friday
- Saturday
- Sunday

The weekly selector should visually match the brutalist design system.

---

# 3. Reminder System

The reminder system is a core technical component.

Requirements:

- Local notifications
- Scheduled reminders
- Background execution support
- Persistent notifications after app restart
- Timezone-safe scheduling
- Scalable architecture

Notification scheduling must remain completely separated from UI logic.

---

# 4. Analytics & Progress

Analytics is one of the main pillars of the application.

The analytics system includes:

## Current Streak

Current consecutive completion count.

## Best Streak

All-time highest streak.

## 90-Day Heatmap

GitHub-inspired consistency visualization.

Purpose:

- Long-term accountability
- Pattern recognition
- Motivation through consistency

## Weekly Performance Chart

Vertical activity charts displaying:

- Weekly habit completion volume
- Consistency trends
- Activity density

## Completion Metrics

Statistics include:

- Completion percentage
- Total completed days
- Habit consistency metrics

---

# 5. Calendar History

The calendar feature provides historical auditing.

Responsibilities:

- Monthly performance overview
- Daily completion inspection
- Historical mission lookup
- Timeline navigation

The calendar must integrate directly with habit completion history.

---

# 6. Settings & Control Center

The settings section acts as the application's control center.

Responsibilities:

- Theme switching
- Notification management
- Data export
- System preferences

Supported export formats:

- PDF
- Excel

The export system should support future scalability.

---

# Technical Architecture

---

# Architecture Style

The project follows:

- Clean Architecture
- MVVM
- Feature-First Organization

Core principles:

- Scalability
- Testability
- Separation of concerns
- Predictable data flow
- Modular features

---

# State Management

The application uses:

- Riverpod
- AsyncNotifier
- NotifierProvider

Goals:

- Reactive UI
- Predictable state transitions
- Async safety
- Scalable dependency management

---

# Local Storage

Primary local database:

- Hive CE

Storage responsibilities:

- Habits
- Habit completion history
- User preferences
- Settings
- Notification metadata

---

# Navigation

Navigation structure:

Bottom navigation tabs:

- Dashboard
- Calendar
- Analytics
- Profile / Settings

Navigation package:

- go_router

---

# Feature Structure

Each feature follows:

features/feature_name/
│
├── data/
├── domain/
└── presentation/

This structure is mandatory.

---

# Domain Philosophy

Business logic must remain independent from:

- Flutter UI
- Hive
- External packages

The domain layer represents the application's true business behavior.

---

# Habit System Architecture

The application separates:

## Habit

Defines the habit itself:

- name
- icon
- frequency
- schedule
- reminder
- notes

## HabitCompletion

Defines completion history:

- habitId
- date
- completion state

Completion state must never live directly inside Habit.

---

# Notification Philosophy

Notifications are treated as infrastructure, not UI behavior.

Rules:

- UI never schedules notifications directly
- Notification services handle scheduling
- Notification IDs must remain persistent
- Scheduling logic must survive application restarts

---

# Project Goals

This project aims to become:

- A production-quality Flutter codebase
- A scalable architecture reference
- A Riverpod learning reference
- A professional notification system example
- A high-quality UI implementation example

The codebase should prioritize:

- Readability
- Maintainability
- Predictability
- Architectural discipline
- Long-term scalability

---

# Engineering Principles

The project follows these principles:

- Single responsibility
- Feature isolation
- Predictable naming
- Explicit architecture boundaries
- Minimal hidden behavior
- Reusable components
- Strict separation between layers

---

# Long-Term Vision

The architecture should support future expansion including:

- Cloud synchronization
- Authentication
- Multi-device support
- Shared habits
- Advanced analytics
- AI-generated productivity insights
- Wearable integrations
- Desktop support

The current architecture must be built with future scalability in mind from day one.