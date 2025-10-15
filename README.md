## Business Code (Flutter)

Modular Flutter application built with Clean Architecture and SOLID principles. The app separates concerns into distinct layers (data, domain, presentation), uses BLoC for orchestration, and dependency injection configured in `lib/configurations/di` to keep code testable and maintainable.

### Tech Stack
- **Flutter** (stable)
- **State Management**: BLoC/Cubit (feature-scoped BLoCs)
- **DI**: `get_it` (registrations under `lib/configurations/di`)
- **Networking & Services**: abstractions and clients in `lib/core`
- **Localization**: ARB files under `l10n/` with generated accessors in `lib/generated`
- **UI**: Reusable widgets and design system under `lib/shared/ui`

### Features
- **Authentication**: flows, widgets, and presentation logic in `lib/features/auth`
- **Card Management**: list, details, and actions in `lib/features/card_management`
- **Shared Overlays & App Shell**: cross-cutting UI in `lib/shared/ui` and `lib/shell`

### Architecture
- **Presentation**: Widgets + BLoCs, no business logic in UI
- **Domain**: Use cases and entities (invoked by BLoCs)
- **Data**: Repositories, data sources, DTOs (called by domain only)
- **Core**: Cross-cutting concerns (network, caching, validators, resources)

### Directory Structure (excerpt)
```
lib/
  configurations/    # DI, navigation, UI theme/config
  core/              # network, services, validators, resources
  features/
    auth/            # auth slice (presentation/domain/data)
    card_management/ # card slice (presentation/domain/data)
  shared/ui/         # reusable widgets, overlays, components
  shell/             # app shell, global BLoC, scaffolding
  generated/         # intl/l10n generated files
```

### Getting Started
```bash
flutter pub get
flutter run
```

### Localization
- Edit or add ARB files under `l10n/` (e.g., `intl_en.arb`, `intl_ar.arb`)
- Generated accessors are available under `lib/generated` (e.g., `l10n.dart`)
```bash
flutter gen-l10n
```

### Assets
Fonts and SVGs live under `assets/` and are declared in `pubspec.yaml` (e.g., `assets/fonts/*`, `assets/svg/*`).

### Notes
- Keep dependencies injected (no direct instantiation inside business logic)
- Prefer immutable models and small, composable widgets
- Handle failures via typed exceptions in `lib/core/app_exceptions`
