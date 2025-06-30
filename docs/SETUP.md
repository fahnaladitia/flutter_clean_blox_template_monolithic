# 🛠 Setup Instructions

## 📖 Table of Contents
- [🛠 Setup Instructions](#-setup-instructions)
  - [📖 Table of Contents](#-table-of-contents)
  - [🔧 1. Change Package Name (Manual Flavor Setup) in application](#-1-change-package-name-manual-flavor-setup-in-application)
    - [✅ Android](#-android)
      - [a. Update `applicationId` in `android/app/build.gradle`](#a-update-applicationid-in-androidappbuildgradle)
      - [b. Update Kotlin Package Structure](#b-update-kotlin-package-structure)
    - [✅ iOS](#-ios)
      - [a. Change Bundle Identifier in Xcode](#a-change-bundle-identifier-in-xcode)
      - [b. Setup Build Configurations](#b-setup-build-configurations)
      - [c. Setup Schemes for Each Flavor](#c-setup-schemes-for-each-flavor)
  - [🌐 2. App Configurations](#-2-app-configurations)
  - [🚀 3. Sentry Initialization](#-3-sentry-initialization)
  - [🔗 4. API Client Configuration](#-4-api-client-configuration)
  - [🔧 5. Error Handling](#-5-error-handling)
  - [🔏 6. Your Keystore.jks \& key.properties](#-6-your-keystorejks--keyproperties)
  - [🔏 7. Github actions secrets](#-7-github-actions-secrets)

## 🔧 1. Change Package Name (Manual Flavor Setup) in application

### ✅ Android

To differentiate between `staging` and `production`, you need to manually configure `applicationId` and package structure:

#### a. Update `applicationId` in `android/app/build.gradle`

```kotlin
    defaultConfig {
        applicationId = "com.pahnal.cleanblox"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }
```

#### b. Update Kotlin Package Structure

For example, if you use `com.yourcompany.appname.staging`:

1. Navigate to:

   ```
   android/app/src/main/kotlin/com/yourcompany/appname/
   ```
2. Add subfolder if needed (`staging/`) and move `MainActivity.kt` into it.
3. Update `MainActivity.kt`:

```kotlin
package com.yourcompany.appname.staging

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {}
```

### ✅ iOS

#### a. Change Bundle Identifier in Xcode

1. Open `ios/Runner.xcodeproj` or `ios/Runner.xcworkspace` in Xcode.
2. In the left panel, select **Runner > TARGETS > Runner > General**.
3. Change **Bundle Identifier**:

   * Staging: `com.yourcompany.appname.staging`
   * Production: `com.yourcompany.appname`

#### b. Setup Build Configurations

1. Go to **Info > Configurations** and duplicate:

   * `Debug` → `Debug-Staging`, `Debug-Production`
   * `Release` → `Release-Staging`, `Release-Production`

2. Assign each configuration with the appropriate `Bundle Identifier` via:

   * **Build Settings > Packaging > Product Bundle Identifier**

#### c. Setup Schemes for Each Flavor

1. Product > Scheme > Manage Schemes
2. Duplicate schemes for each flavor
3. Assign appropriate build configuration

---

## 🌐 2. App Configurations

Add your  configurations in `lib/core/config/app_config.dart`:

```dart

    switch (selectedFlavor) {
      case AppFlavor.staging:
        _config = EnvConfig(
          baseURL: 'https://staging.example.com/api',
          apiKey: 'staging-api-key',
          sentryDSN: 'https://staging.sentry.io/123456',
        );
        break;
      case AppFlavor.production:
        _config = EnvConfig(
          baseURL: 'https://api.example.com',
          apiKey: 'production-api-key',
          sentryDSN: 'https://sentry.example.com/123456',
        );
        break;
    }

```

---

##  🚀 3. Sentry Initialization
In `lib/main_staging.dart` and `lib/main_production.dart`, initialize Sentry:

```dart
import 'package:core/config/app_config.dart';
import 'package:core/utils/sentry_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await SentryService.init(app: () => runApp(const MyApp()));
}

```

---

##  🔗 4. API Client Configuration

In `lib/core/network/app_rest_client.dart`, configure your API client:

```dart
 // Headers can be set here if needed
    baseOptions.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // TODO: Replace with your actual API key
      'x-api-key': apiKey,
    };
```

## 🔧 5. Error Handling

In `lib/core/network/error_interceptor.dart`, handle errors:

```dart
      case DioExceptionType.badResponse:
        if (err.response == null) {
          return NetworkException(
            code: ErrorCodeConstants.unknownCode,
            message: 'Unknown error occurred',
          );
        }

        if (err.response!.statusCode == HttpStatus.badRequest) {
          // TODO: Handle bad request error
          return NetworkException.fromMap(err.response!.data);
        } else if (err.response!.statusCode == HttpStatus.unauthorized) {
          return NetworkException(
            code: ErrorCodeConstants.unauthorizedCode,
            message: ErrorMessageConstants.unauthorizedMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.forbidden) {
          return NetworkException(
            code: ErrorCodeConstants.forbiddenCode,
            message: ErrorMessageConstants.forbiddenMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.notFound) {
          return NetworkException(
            code: ErrorCodeConstants.notFoundCode,
            message: ErrorMessageConstants.notFoundMessage,
          );
        } else if (err.response!.statusCode == HttpStatus.internalServerError) {
          return NetworkException(
            code: ErrorCodeConstants.internalServerErrorCode,
            message: ErrorMessageConstants.internalServerErrorMessage,
          );
        }
```

## 🔏 6. Your Keystore.jks & key.properties
Place your `keystore.jks` file in `android/app/` and create a `key.properties` file with the following content:

```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=your_key_alias
storeFile=keystore.jks
```


## 🔏 7. Github actions secrets

Add the following secrets to your GitHub repository:

- `ANDROID_ALIAS`: Your key alias.
- `ANDROID_ALIAS_PASSWORD`: Your key password.
- `ANDROID_KEYSTORE`: Base64 encoded content of your `keystore.jks` file.
- `KEYSTORE_PASSWORD`: Your keystore password.

