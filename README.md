# 🚀 Flutter CleanBLoX Template

A production-ready Flutter template featuring **BLoC**, **Clean Architecture**, and essential developer tools pre-configured for rapid development. Built to help you kickstart your Flutter projects with a solid, scalable, and maintainable foundation.

Created with ❤️ by [**Pahnal Aditia**](https://www.linkedin.com/in/pahnaladitia)

---

## 📖 Table of Contents

- [🚀 Flutter CleanBLoX Template](#-flutter-cleanblox-template)
  - [📖 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [🧰 Tech Stack](#-tech-stack)
  - [🗂 Project Structure](#-project-structure)
  - [🚀 Getting Started](#-getting-started)
    - [🔧 Setup Instructions](#-setup-instructions)
      - [1. Project \& Package Name](#1-project--package-name)
      - [2. App Links \& Universal Links](#2-app-links--universal-links)
    - [▶️ Run the App](#️-run-the-app)
  - [📝 Notes](#-notes)
  - [🧪 Coming Soon](#-coming-soon)

---

## ✨ Features

* ✅ **Clean Architecture** — Layered structure: `presentation`, `domain`, and `data`
* 🧠 **BLoC Pattern** — Powered by [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
* 🌐 **Networking & Logging** — [`dio`](https://pub.dev/packages/dio), custom logger, [`chucker_flutter`](https://pub.dev/packages/chucker_flutter)
* 🔌 **Dependency Injection** — Managed with [`get_it`](https://pub.dev/packages/get_it)
* 🌍 **Localization** — Multilingual support via [`intl`](https://pub.dev/packages/intl)
* 🛡 **Error Tracking** — Integrated [`sentry_flutter`](https://pub.dev/packages/sentry_flutter)
* 🔗 **Deep & App Links** — Configured using [`go_router`](https://pub.dev/packages/go_router)
* 🖼 **UI Tools** — [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons), [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash)
* 🧪 **Flavor Support** — Predefined build flavors:

  * `Debug-Staging`
  * `Debug-Production`
  * `Release-Staging`
  * `Release-Production`
* ⚡ **Quick Start** — Minimal setup to begin development

---

## 🧰 Tech Stack

| Category                | Packages                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 🧠 State Management     | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)                                                                                                                     |
| 🌐 Networking           | [`dio`](https://pub.dev/packages/dio), [`cote_network_logger`](https://pub.dev/packages/cote_network_logger), [`chucker_flutter`](https://pub.dev/packages/chucker_flutter) |
| 🔌 Dependency Injection | [`get_it`](https://pub.dev/packages/get_it)                                                                                                                                 |
| 🌍 Localization         | [`intl`](https://pub.dev/packages/intl)                                                                                                                                     |
| 🔗 Routing & Deep Links | [`go_router`](https://pub.dev/packages/go_router)                                                                                                                           |
| 🛡 Error Tracking       | [`sentry_flutter`](https://pub.dev/packages/sentry_flutter)                                                                                                                 |
| 🖼 UI Assets            | [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons), [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash)                      |
| 🧪 Flavoring Support    | Manual setup using `productFlavors`                                                                                                                                         |

---

## 🗂 Project Structure

```bash
lib/
├── app/                   # App setup and routing
├── core/                  # Configs, constants, DI, interceptors
├── data/                  # Data sources, DTOs, mappers, repositories
├── domain/                # Use cases, models, repositories
├── presentation/          # Pages, widgets, blocs, themes
├── l10n/                  # Localization files
├── main_staging.dart      # Main entry for staging
└── main_production.dart   # Main entry for production
```

---

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/fahnaladitia/flutter_clean_blox_template.git

# 2. Get dependencies
flutter pub get
```

### 🔧 Setup Instructions

#### 1. Project & Package Name

See [SETUP.md](SETUP.md) for how to manually configure your project’s package name and build flavors.

#### 2. App Links & Universal Links

To enable Android and iOS deep linking, follow [APPLINKS.md](APPLINKS.md).

---

### ▶️ Run the App

```bash
# For staging
dart run --flavor staging -t lib/main_staging.dart

# For production
dart run --flavor production -t lib/main_production.dart
```

---

## 📝 Notes

* Replace `YOUR_DSN_HERE` in `main.dart` with your Sentry DSN.
* Update `baseURL` in `main_*.dart`.
* Customize error handling in `error_interceptor.dart`.
* Follow official docs for more detailed configuration:

  * [Sentry Flutter](https://docs.sentry.io/platforms/flutter/)
  * [Dio](https://pub.dev/packages/dio#interceptors)
  * [GetIt](https://pub.dev/packages/get_it)
  * [BLoC](https://pub.dev/packages/flutter_bloc)
  * [Intl](https://pub.dev/packages/intl)
  * [go\_router](https://pub.dev/packages/go_router)
  * [Chucker Flutter](https://pub.dev/packages/chucker_flutter)
  * [Cote Network Logger](https://pub.dev/packages/cote_network_logger)
  * [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
  * [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)
  * [Flutter Flavoring](https://docs.flutter.dev/deployment/flavors)
  * [Flutter App & Universal Links](https://docs.flutter.dev/cookbook/navigation/set-up-app-links)

---

## 🧪 Coming Soon

* [ ] ✅ **Unit & Widget Testing** — With [`flutter_test`](https://pub.dev/packages/flutter_test) & [`mocktail`](https://pub.dev/packages/mocktail)
* [ ] ✅ **CI/CD Pipeline** — GitHub Actions workflow
* [ ] ✅ **Firebase Integration** — Analytics, Auth, Firestore, Crashlytics
* [ ] ✅ **Push Notification Setup** — With Firebase Cloud Messaging

