## Business Code (Flutter)

Modular Flutter application built with Clean Architecture and SOLID principles. The app separates concerns into distinct layers (data, domain, presentation), uses BLoC for orchestration, and dependency injection configured in `lib/configurations/di` to keep code testable and maintainable.

### Media Preview
<img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/e0b0b0a9-d53b-4378-851c-8f2d0e8b724a" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/d5fc70ab-285d-443d-8b79-f269b79a3fa0" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/343ec9dc-589e-4e02-bde0-8363e4f77d25" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/d5bafa92-951c-4ce9-bed4-a2f9938db93c" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/12db3f27-c438-477e-91dd-d7c86a97acbd" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/ed713b90-cee8-439a-91ce-fe0a69f620a5" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/d20f9df6-8cf2-4c2d-b377-dea649881e8e" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/f525e2e1-0d15-4ebb-aaae-99a5cbb43ced" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/e94dbf4b-d018-471e-8361-39fa89418a16" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/98114264-18da-4e9f-ac3e-8f6a952720a3" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/1076ce30-ee9e-4b31-a5b3-a0d81df022e3" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/ec2dbb4a-4b4e-4746-a2b2-d4bf079d34be" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/5728acd2-b4ec-4f31-84af-4e99df04e58a" /> <img width="300" height="800" alt="image" src="https://github.com/user-attachments/assets/11b03205-7315-4cf3-8bcf-4c49da394926" />

https://github.com/user-attachments/assets/ff6f1fb4-8c8e-425e-b203-4fd7729e8748

https://github.com/user-attachments/assets/591c8f62-6c6e-4d4e-ae30-f313e6c36228

https://github.com/user-attachments/assets/de5ee9eb-3abd-4da1-afbe-c2c695726783

https://github.com/user-attachments/assets/b5fcf981-3851-492f-90ec-1a5db35930f7


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
