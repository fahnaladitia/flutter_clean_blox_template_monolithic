# 🛠 Setup Instructions

## 🔧 1. Change Package Name (Manual Flavor Setup)

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

## 🔐 2. Sentry Setup

Add your Sentry DSN in `main.dart`:

```dart
await SentryFlutter.init(
  (options) {
    options.dsn = 'YOUR_DSN_HERE';
  },
  appRunner: () => runApp(MyApp()),
);
```

---

## 🌐 3. API Base URL

Set your API URL in `main_*.dart`:

```dart
const String baseURL = 'https://api.yourdomain.com';
```

---

## 🚨 4. Handle API Errors

In `lib/core/config/interceptors/error_interceptor.dart`:

```dart
if ((err.response!.statusCode ?? 0) >= 401 &&
    (err.response!.statusCode ?? 0) < 500) {
  // TODO: Handle from 401 to 499
  return NetworkException.fromMap(err.response!.data);
}
```

## 🔏 5 Your Keystore.jks & key.properties
Place your `keystore.jks` file in `android/app/` and create a `key.properties` file with the following content:

```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=your_key_alias
storeFile=keystore.jks
```

## 🔑 6. Handle Github Actions
To handle GitHub Actions, ensure you have the following secrets set up in your repository:

- `ANDROID_ALIAS`
- `ANDROID_ALIAS_PASSWORD`
- `ANDROID_KEYSTORE`
- `KEYSTORE_PASSWORD`

You can set these secrets in your GitHub repository settings under **Settings > Secrets and variables > Actions**.