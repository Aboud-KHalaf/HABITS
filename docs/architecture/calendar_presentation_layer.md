# Calendar Presentation Layer Architecture

## Overview
This document outlines the architectural decisions and design philosophy behind the Calendar feature's presentation layer in HABITS. The goal was to build a scalable, responsive, and adaptive UI that adheres to Clean Architecture, MVVM, and Riverpod while honoring the Neo-Brutalist v2 design language.

## Architecture & Scalability

### Why Separate Widgets?
The Calendar UI is divided into several isolated, single-responsibility widgets (e.g., `BrutalCalendarCell`, `CalendarHeader`, `MissionSection`). This prevents the creation of "God Widgets" and giant `build` methods. By keeping each widget isolated:
1. **Maintainability**: Modifying the calendar cell styling doesn't require traversing a 1000-line screen file.
2. **Reusability**: `BrutalCalendarCell` can be reused in future widgets if needed (e.g., small inline calendars).
3. **Performance**: Only the components that depend on specific states (like `selectedDateViewModel`) will rebuild when that state changes, avoiding unnecessary full-screen repaints.

### State Management (Riverpod + MVVM)
We employ Riverpod with `AsyncNotifier` (or basic `Notifier` for purely local ephemeral UI state like selected date). 
- **`calendar_viewmodel.dart`**: Orchestrates the current month view and the state of the calendar.
- **`selected_date_viewmodel.dart`**: Simply manages the currently selected date, allowing the mission list and calendar cells to watch and update instantly.
This strict decoupling ensures the View layer contains no business logic.

## Responsive & Adaptive UI Composition

### How Responsive Layouts Were Approached
A core requirement was to support Mobile, Tablet, and Desktop natively.
- **Responsive Components**: Widgets like `BrutalCalendarCell` take up the available flex space or use `AspectRatio` rather than hardcoded widths. 
- **Adaptive Scaffolds**: We use `AdaptiveScaffold` (from shared) which switches out the entire layout shell based on `Breakpoints`.

### Adaptive Composition
Instead of sprinkling `if (isDesktop)` throughout a single `calendar_page.dart`, the layout is managed via composition:
- `MobileCalendarLayout`: Stacks the calendar and missions vertically. Uses bottom navigation.
- `TabletCalendarLayout`: Similar to mobile or introduces a side panel.
- `DesktopCalendarLayout`: Introduces a multi-column layout where the calendar gets significant real estate and the missions sit in a fixed side panel.

## "How To Think About Scalable Presentation Architecture"
*A note for engineers on building scalable UI systems.*

Why do giant screens become unmaintainable? Because they tightly couple structure, styling, and behavior. When asked to make a screen responsive, engineers often try to stretch elements or inject fragile conditionals.

### Split UI into Regions
Identify logical blocks of your UI. The Calendar UI isn't one screen; it's a composition of regions:
- The Calendar Grid (Month/Year controls + Date Cells + Legend)
- The Selected Date Overview
- The Daily Missions List

### Extract Reusable Widgets
Any piece of UI that represents a distinct domain concept (a calendar cell, a mission item) must be its own widget file. This makes your codebase a library of reusable Lego bricks rather than a collection of monolithic screens.

### Architect Responsive Layouts
Think in systems, not isolated screens. A responsive layout means that the structural composition changes based on constraints, while the internal regions simply scale. 
- Avoid tightly coupled UI. 
- Avoid hardcoded widths.
- Let parents define constraints, and let children fill them optimally.

By decoupling the "What" (the data and regions) from the "How" (the layout composition), you build frontend architectures that can effortlessly scale to any platform or window size.
