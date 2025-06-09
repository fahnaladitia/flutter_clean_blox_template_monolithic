# 🚀 Flutter CleanBLoX Template

A production-ready Flutter template with **BLoC**, **Clean Architecture**, and essential dev tools pre-configured for rapid development.

This template is designed to help you kickstart your Flutter projects with a solid foundation, focusing on maintainability and scalability.

Created by **[Pahnal Aditia](https://www.linkedin.com/in/pahnaladitia)** ❤️
## 📖 Table of Contents
- [🚀 Flutter CleanBLoX Template](#-flutter-cleanblox-template)
  - [📖 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [📦 Tech Stack](#-tech-stack)
  - [🗂 Project Structure](#-project-structure)
  - [⚙️ Features](#️-features)
  - [🚀 Getting Started](#-getting-started)
    - [Setup Instructions](#setup-instructions)
      - [1. Prepare your packages name](#1-prepare-your-packages-name)
      - [2. 🔐 Sentry](#2--sentry)
        - [Add your Sentry DSN in main.dart:](#add-your-sentry-dsn-in-maindart)
      - [3. API Base URL](#3-api-base-url)
        - [Set your API base URL in `lib/core/constants/app_constants.dart`:](#set-your-api-base-url-in-libcoreconstantsapp_constantsdart)
      - [4. Handle API errors globally](#4-handle-api-errors-globally)
        - [Handle API Errors Bad Request, Unauthorized, etc. in `lib/core/config/interceptors/error_interceptor.dart`:](#handle-api-errors-bad-request-unauthorized-etc-in-libcoreconfiginterceptorserror_interceptordart)
      - [📝 Notes](#-notes)
    - [📚 Credits](#-credits)
        - [This template is inspired by:](#this-template-is-inspired-by)
    - [🧪 Coming Soon](#-coming-soon)
---



## ✨ Features

- ***Clean Architecture*** - Contains presentation, domain, and data layers.
- ***BLoC Pattern*** - State management using the BLoC pattern.
- ***Network Logging*** - Integrated Dio with custom network logger.
- ***Dependency Injection*** - Uses GetIt for managing dependencies.
- ***Internationalization*** - Supports multiple languages with intl package.
- ***Error Tracking*** - Integrated Sentry for global error tracking.

---

## 📦 Tech Stack

| Layer             | Tools / Packages                              |
|------------------|------------------------------------------------|
| 🧠 State Management     | [flutter_bloc](https://pub.dev/packages/flutter_bloc) |
| 🌐 Networking     | [dio](https://pub.dev/packages/dio) + custom [cote_network_logger]() |
| 🔌 DI             | [get_it](https://pub.dev/packages/get_it)     |
| 🌍 Localization   | [intl](https://pub.dev/packages/intl)         |
| 🪵 Logging        | [logger](https://pub.dev/packages/logger), [chucker_flutter](https://pub.dev/packages/chucker_flutter) |
| 🧱 Architecture   | Clean Architecture (presentation, domain, data) |
| 🛡 Error Tracking | [sentry_flutter](https://pub.dev/packages/sentry_flutter) |

---

## 🗂 Project Structure
```
flutter_clean_blox_template/
lib/
├── main.dart // Entry point of the application
├── app/
│   ├── my_app.dart // Main application widget
│   ├── router/ // Navigation and routing setup
├── core/
│   ├── common/
│   │   ├── constants/ // Application constants
│   │   ├── exceptions/ // Custom exceptions
│   │   ├── usecases/ // Common use cases
│   ├── config/
│   │   ├── interceptors/ // Network interceptors
│   │   │   ├── error_interceptor.dart // Handles API errors globally
│   │   │   ├── token_interceptor.dart // Handles token management
│   │   ├── app_rest_client.dart // REST client configuration
│   ├── di/
│   │   ├── bloc_module.dart // BLoC dependency injection
│   │   ├── database_module.dart // Database dependency injection
│   │   ├── injection.dart // Main dependency injection setup
│   │   ├── network_module.dart // Network dependency injection
│   │   ├── repository_module.dart // Repository dependency injection
│   │   ├── usecase_module.dart // Use case dependency injection
│   ├── utils/
│   │   ├── validators.dart // Input validators
├── data/
│   ├── repositories/ // Data repositories
│   ├── mappers/ // For mapping dto, entities, and models
│   ├── sources/ 
│   │   ├── local/
│   │   │   ├── databases/ // Local database sources
│   │   │   ├── entities/ // Local data entities
│   │   ├── remote/
│   │   │   ├── api/ // Remote API sources
│   │   │   ├── dto/
│   │   │   │   ├── requests/ // API request DTOs
│   │   │   │   ├── responses/ // API response DTOs
│   │   │   ├── firebase/ // Firebase sources 
├── l10n/ // Localization files 
├── domain/
│   ├── models/ // Domain models
│   ├── repositories/ // Domain repositories
│   ├── usecases/ // Domain use cases (business logic) usecase & param
├── presentation/ 
│   ├── blocs/ // Global BLoC classes 
│   ├── pages/ // UI pages
│   ├── widgets/ // Reusable UI components
│   ├── themes/ // Theme and styling
```
---

## ⚙️ Features

- ✅ Built-in **Clean Architecture** layers
- ✅ Ready-to-use **BLoC** pattern
- ✅ Network logging with **Dio + Chucker**
- ✅ Global error tracking with **Sentry**
- ✅ **GetIt** for dependency injection
- ✅ Support for internationalization (**intl**)
- ✅ Custom logger via `cote_network_logger`

---

## 🚀 Getting Started

```bash
# 1. Clone this repository
git clone https://github.com/fahnaladitia/flutter_clean_blox_template.git

# 2. Get packages
flutter pub get

# 3. Run the app
flutter run
```

### Setup Instructions

#### 1. Prepare your packages name
```bash
dart run change_app_package_name:main com.yourpackage.name
```

#### 2. 🔐 Sentry
##### Add your Sentry DSN in main.dart:


```dart
await SentryFlutter.init(
  (options) {
    options.dsn = 'YOUR_DSN_HERE';
  },
  appRunner: () => runApp(MyApp()),
);
```

#### 3. API Base URL
##### Set your API base URL in `lib/core/constants/app_constants.dart`:
```dart
  static const String baseUrl = 'https://yourapi.com';
```

#### 4. Handle API errors globally
##### Handle API Errors Bad Request, Unauthorized, etc. in `lib/core/config/interceptors/error_interceptor.dart`:
```dart
if ((err.response!.statusCode ?? 0) >= 401 &&
    (err.response!.statusCode ?? 0) < 500) {
  // TODO: Handle from 401 to 499
  return NetworkException.fromMap(err.response!.data);
 }
```

---

#### 📝 Notes
- Make sure to replace `YOUR_DSN_HERE` with your actual Sentry DSN.
- Update the `baseURL` with your API endpoint.
- Customize the error handling logic in `error_interceptor.dart` as per your API's error response structure.
- Ensure you have the necessary permissions and configurations for Sentry in your Flutter project.
- For more details on Sentry setup, refer to the [Sentry Flutter documentation](https://docs.sentry.io/platforms/flutter/).
- For more details on Dio interceptors, refer to the [Dio documentation](https://pub.dev/packages/dio#interceptors).
- For more details on GetIt, refer to the [GetIt documentation](https://pub.dev/packages/get_it).
- For more details on BLoC, refer to the [flutter_bloc documentation](https://pub.dev/packages/flutter_bloc).
- For more details on Clean Architecture, refer to the [Clean Architecture documentation](https://www.freecodecamp.org/news/understanding-clean-architecture-in-flutter/).
- For more details on localization, refer to the [flutter_localizations documentation](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).
- For more details on the intl package, refer to the [intl documentation](https://pub.dev/packages/intl).
- For more details on the logger package, refer to the [logger documentation](https://pub.dev/packages/logger).
- For more details on Chucker, refer to the [chucker_flutter documentation](https://pub.dev/packages/chucker_flutter).
- For more details on the cote_network_logger, refer to the [cote_network_logger documentation](https://pub.dev/packages/cote_network_logger).
- For more details on the change_app_package_name package, refer to the [change_app_package_name documentation](https://pub.dev/packages/change_app_package_name).

---

### 📚 Credits
##### This template is inspired by:
- Clean Architecture principles by Uncle Bob
- BLoC library by Felix Angelov
- Community tools like Dio, GetIt, and Sentry
  

### 🧪 Coming Soon

- [ ] Unit & widget testing setup
- [ ] GitHub Actions CI/CD
- [ ] Firebase support