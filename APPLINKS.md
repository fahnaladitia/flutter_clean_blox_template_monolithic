# 🔗 App Links & Deep Links Setup

This guide outlines how to set up **Universal Links** for iOS and **App Links** for Android to support deep linking in your Flutter app.

---

## 📱 iOS: Universal Links

### 🔹 Step 1: Create `apple-app-site-association` file

Create a JSON file with the following format:

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "<TEAM_ID>.<BUNDLE_IDENTIFIER>",
        "paths": ["*"]
      }
    ]
  }
}
```

Replace:

* `<TEAM_ID>` with your Apple Developer Team ID.
* `<BUNDLE_IDENTIFIER>` with your app's bundle ID (e.g., `com.example.app.staging`).

### 🔹 Step 2: Host the File

Place the `apple-app-site-association` file at the root of your HTTPS domain:

```
https://yourdomain.com/apple-app-site-association
```

Make sure:

* The file is served over HTTPS.
* The content type is `application/json` (no `.json` extension).

---

## 🤖 Android: App Links

### 🔹 Step 1: Create `assetlinks.json` file

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.example.app.staging",
      "sha256_cert_fingerprints": [
        "YOUR_SHA256_FINGERPRINT"
      ]
    }
  }
]
```

Replace:

* `package_name` with your Android application ID.
* `YOUR_SHA256_FINGERPRINT` with your signing key fingerprint.

You can get the SHA256 fingerprint by running:

```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

### 🔹 Step 2: Host the File

Place the `assetlinks.json` file under:

```
https://yourdomain.com/.well-known/assetlinks.json
```

Ensure the file is publicly accessible via browser.

---

## 📂 Example Files

Example configurations are provided in the [`applinks`](./applinks) folder:

* [apple-app-site-association](./applinks/apple-app-site-association)
* [assetlinks.json](./applinks/assetlinks.json)

These examples can be modified according to your domain and package configurations.
