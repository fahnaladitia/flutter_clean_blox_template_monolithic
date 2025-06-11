# 🚀 Flutter CleanBLoX Template

A production-ready Flutter template with **BLoC**, **Clean Architecture**, and essential dev tools pre-configured for rapid development.

This template is designed to help you kickstart your Flutter projects with a solid foundation, focusing on maintainability and scalability.

Created by **[Pahnal Aditia](https://www.linkedin.com/in/pahnaladitia)** ❤️
## 📖 Table of Contents
- [🚀 Flutter CleanBLoX Template](#-flutter-cleanblox-template)
  - [📖 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [🧰 Tech Stack](#-tech-stack)
  - [🗂 Project Structure](#-project-structure)
  - [🚀 Getting Started](#-getting-started)
    - [Setup Instructions](#setup-instructions)
      - [1. Prepare your packages name](#1-prepare-your-packages-name)
      - [2. 🔐 Sentry](#2--sentry)
        - [Add your Sentry DSN in main.dart:](#add-your-sentry-dsn-in-maindart)
      - [3. API Base URL](#3-api-base-url)
        - [Set your API base URL in `lib/core/constants/app_constants.dart`:](#set-your-api-base-url-in-libcoreconstantsapp_constantsdart)
      - [4. Handle API errors globally](#4-handle-api-errors-globally)
        - [Handle API Errors Bad Request, Unauthorized, etc. in `lib/core/config/interceptors/error_interceptor.dart`:](#handle-api-errors-bad-request-unauthorized-etc-in-libcoreconfiginterceptorserror_interceptordart)
      - [5. App Links \& Deep Links](#5-app-links--deep-links)
        - [To enable deep linking and app links for both iOS and Android, you need to set up the following (file examples in `applinks/apple_app_site_association and apps/assetlinks.json`):](#to-enable-deep-linking-and-app-links-for-both-ios-and-android-you-need-to-set-up-the-following-file-examples-in-applinksapple_app_site_association-and-appsassetlinksjson)
          - [1. IOS Universal Links](#1-ios-universal-links)
          - [2. Android App Links](#2-android-app-links)
      - [📝 Notes](#-notes)
    - [📚 Credits](#-credits)
    - [🧪 Coming Soon](#-coming-soon)
---

## ✨ Features

- ✅ **Clean Architecture** — Layered structure: `presentation`, `domain`, and `data`.
- 🧠 **BLoC Pattern** — State management with [`flutter_bloc`](https://pub.dev/packages/flutter_bloc).
- 🌐 **Network Logging** — With [`dio`](https://pub.dev/packages/dio), custom logger, and [`chucker_flutter`](https://pub.dev/packages/chucker_flutter).
- 🔌 **Dependency Injection** — Powered by [`get_it`](https://pub.dev/packages/get_it).
- 🌍 **Localization** — Supports multiple locales using [`intl`](https://pub.dev/packages/intl).
- 🛡 **Error Tracking** — Integrated [`sentry_flutter`](https://pub.dev/packages/sentry_flutter).
- 🔗 **Deep Links & App Links** — Configured with [`go_router`](https://pub.dev/packages/go_router), supporting Android & iOS.
- 🖼 **UI Tools** — App icons and splash screens via `flutter_launcher_icons` and `flutter_native_splash`.
- ⚡ **Quick Setup** — Minimal config to get started fast.

---

## 🧰 Tech Stack

| Category               | Package(s)                                                                                                                                                  |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 🧠 State Management     | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)                                                                                                     |
| 🌐 Networking           | [`dio`](https://pub.dev/packages/dio), `cote_network_logger`, [`chucker_flutter`](https://pub.dev/packages/chucker_flutter)                                |
| 🔌 Dependency Injection | [`get_it`](https://pub.dev/packages/get_it)                                                                                                                 |
| 🌍 Localization         | [`intl`](https://pub.dev/packages/intl)                                                                                                                     |
| 🔗 Routing & Deep Links | [`go_router`](https://pub.dev/packages/go_router)                                                                                                           |
| 🛡 Error Tracking       | [`sentry_flutter`](https://pub.dev/packages/sentry_flutter)                                                                                                 |
| 📦 Package Management   | [`change_app_package_name`](https://pub.dev/packages/change_app_package_name)                                                                               |
| 🖼 UI Assets            | [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons), [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash)       |

---

## 🗂 Project Structure

```bash
lib/
├── app/                 # App setup and routing
├── core/                # Configs, constants, di, interceptors
├── data/                # Data sources, DTOs, mappers, repositories
├── domain/              # Use cases, models, repositories
├── presentation/        # Pages, widgets, blocs, themes
├── l10n/                # Localization files
└── main.dart            # App entry point
```
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
  static const String appName = 'Your App Name';
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

#### 5. App Links & Deep Links
##### To enable deep linking and app links for both iOS and Android, you need to set up the following (file examples in `applinks/apple_app_site_association and apps/assetlinks.json`):
###### 1. IOS Universal Links
1. Set one value in the appIDs array to `<team id>.<bundle id>`.

2. Set the `paths` array to `["*"]`. The paths array specifies the allowed universal links. Using the asterisk, `*` redirects every path to the Flutter app. If needed, change the paths array value to a setting more appropriate to your app.

3. Host the file at a URL that resembles the following structure.

```bash
# IOS Universal Links
https://yourdomain.com/apple-app-site-association
```
4. Verify that your browser can access this file.

###### 2. Android App Links

1. Set the `relation` array to `["delegate_permission/common.handle_all_urls"]`. The relation array specifies the allowed app links. Using the `delegate_permission/common.handle_all_urls` relation redirects every path to the Flutter app. If needed, change the relation array value to a setting more appropriate to your app.
2. Set the `target` object to include the `package_name` and `sha256_cert_fingerprints` of your app. The package_name is the same as the Android application ID, and the sha256_cert_fingerprints is the SHA-256 fingerprint of your app's signing certificate.
3. Host the file at a URL that resembles the following structure.

```bash
# Android App Links
https://yourdomain.com/.well-known/assetlinks.json
```
4. Verify that your browser can access this file.

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.yourpackage.name",
      "sha256_cert_fingerprints": [
        "YOUR_SHA256_FINGERPRINT"
      ]
    }
  }
]
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

This template is inspired by:

- **Clean Architecture** principles by *Robert C. Martin (Uncle Bob)*
- **BLoC** state management by [Felix Angelov](https://github.com/felangel)
- Open-source community tools like:
  - [`dio`](https://pub.dev/packages/dio)
  - [`get_it`](https://pub.dev/packages/get_it)
  - [`sentry_flutter`](https://pub.dev/packages/sentry_flutter)
  - [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
  - [`go_router`](https://pub.dev/packages/go_router)
- **Flutter** and its ecosystem for making app development delightful
- **Pahnal Aditia** for creating this template to help others kickstart their Flutter projects
- **All contributors** who have improved this template over time

---
### 🧪 Coming Soon

- [ ] ✅ **Unit & Widget Testing Setup**  
  Using [`flutter_test`](https://pub.dev/packages/flutter_test) along with mocking tools like [`mocktail`](https://pub.dev/packages/mocktail) for thorough test coverage.

- [ ] ✅ **CI/CD with GitHub Actions**  
  Automated build, test, and deployment pipeline using GitHub Actions.

- [ ] ✅ **Firebase Integration**  
  Includes Analytics, Crashlytics, Authentication, Firestore, and more.

- [ ] ✅ **Push Notifications Setup**  
  Full configuration of Firebase Cloud Messaging (FCM) for both Android and iOS.

- [ ] ✅ **Multiple Flavors Support (dev, staging, prod)**  
  Full support for multiple environments via Flutter’s `--flavor` option and environment-specific configuration (e.g. API base URLs, Firebase options).
