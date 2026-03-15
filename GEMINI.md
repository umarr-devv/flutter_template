# AI Development Guidelines (GEMINI.md)

This is an instruction file that must be read and taken into account when generating code, making changes, and designing new features in the project.

## Rules & Guidelines

### Core Principles

1. **No Hardcoding:** Never hardcode strings, numeric values (paddings, margins, font sizes), colors, and other visual aspects directly in the code.
2. **Reuse Constants & Themes:** Use already defined constants, themes (`Theme.of(context)`), text styles, and project variables.
3. **Reuse Widgets:** Always check for existing basic UI components (including those in the `shared/` folder) before creating new ones to avoid duplicating common UI.
4. **Reuse Dependencies:** Use already added packages to solve tasks, avoid adding new packages with similar functionality if they already exist in the project.
5. **Strict Structure:** When creating new files and classes, strictly follow the established architecture and directory structure. Files must be located in their logical and intended folders.
6. **No `setState`:** Never use `setState` for state management in the UI. For local reactive state of widgets, use `ValueNotifier` + `ValueListenableBuilder`. No exceptions are allowed.
7. **Styling via `ThemeData`:** Do not set styles, colors, and fonts via separate parameters of widgets. All visual settings and colors must be inherited from the global `ThemeData` object. UI customization should be done by configuring global themes.

### Additional Rules

1. **Performance (`const`):** Maximize the use of `const` constructors for widgets, arrays, and objects to minimize rebuilds.
2. **Strict Typing:** Do not use `dynamic` and avoid `var` (unless the type is obvious from the right-hand side). Explicitly specify types for return values, callback parameters, and lists.
3. **Small Widgets:** Break down complex `build` methods into smaller ones by creating separate Stateless or ValueListenable widgets, isolating the rendering logic.
4. **Layer Separation:** Business logic elements and data layer components should not import UI libraries (e.g., `flutter/material.dart`). The UI (screens) should not contain raw HTTP logic.
5. **Null Safety:** Avoid force unwrapping (`!`), use safe extraction (`?` or `if (... != null)`).

---

## Architecture and Project Structure

The project is logically divided into modules for the data layer, global core, and features (Feature-wise structure). Without tying to specific screens, the project tree looks as follows:

### `lib/`

* **`blocs/`**
  Global business logic (BLoC / Cubit / other state managers) that affects the application as a whole, rather than a single specific feature (e.g., user session listeners, global network status, app settings).

* **`core/`**
  The core of the application. Contains configuration files, system utilities, basic abstract classes, global theme settings (ThemeUtils, ColorScheme), router (navigation) configurations, and network clients. This is the low-level layer of the application.

* **`data/`**
  Centralized data layer. Stores models (Data Entities / DTOs), repositories (interface implementations), local databases, data parsing, and data sources (API clients). This layer provides data to the other layers of the application.

* **`features/`**
  Isolated user scenarios and application sections (features). Each functionality is encapsulated within its own folder, which may contain screens, local widgets, feature-specific logic, controllers/BLoCs. Features should be as independent from each other as possible.

* **`l10n/`**
  Localization directory. Stores translation files (e.g., ARB) and generated classes for multi-language support. All text strings in the UI must come exclusively from here.

* **`shared/`**
  Shared, reusable widgets and atomic UI components. This is where ready-made buttons, inputs, dialogs, and cards are placed, to be used universally across different `features/`.

* **`app.dart` & `main.dart`**
  Entry point, basic dependencies injection, application initialization (launching the main widget of the tree `App`, attaching the router and localizations).
