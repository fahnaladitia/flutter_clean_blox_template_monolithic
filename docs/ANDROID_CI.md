## # Android Release CI with Flavor & Signing

```yml
name: Android Release CI with Flavor & Signing

on:
  push:
    branches:
      - "dev"
      - "main"
    paths-ignore:
      - 'docs/**'
      - '**.md'
  pull_request:
    branches:
      - "dev"
      - "main"
    paths-ignore:
      - 'docs/**'
      - '**.md'

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        # Define the flavors you want to build
        # flavor: [staging, production]
        flavor: [production]

    steps:
      - name: 🔄 Checkout Repository
        uses: actions/checkout@v4

      - name: 🛠️ Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable
          flutter-version-file: pubspec.yaml

      - name: 📦 Install Dependencies
        run: flutter pub get

      - name: 🔍 Flutter version
        run: flutter --version

      - name: 🔧 Configure Flutter
        run: flutter analyze

      - name: ✅ Run tests
        run: flutter test

      - name: 🗝️ Decode keystore.jks from secret
        run: |
          echo "${{ secrets.ANDROID_KEYSTORE }}" | base64 -d > application/android/app/keystore.jks

      - name: 🗂️ Create key.properties file
        run: |
          cat <<EOF > application/android/key.properties
          storePassword=${{ secrets.KEYSTORE_PASSWORD }}
          keyPassword=${{ secrets.ANDROID_ALIAS_PASSWORD }}
          keyAlias=${{ secrets.ANDROID_ALIAS }}
          storeFile=keystore.jks
          EOF

      - name: "🏗 Build Signed APK with Flavor: ${{ matrix.flavor }}"
        run: |
          cd application
          flutter build apk --obfuscate --split-debug-info=out/android --flavor ${{ matrix.flavor }} -t lib/main_${{ matrix.flavor }}.dart

      - name: 📦 Upload APK Artifact
        uses: actions/upload-artifact@v4
        with:
          name: ${{ matrix.flavor }}-release-apk
          path: application/build/app/outputs/apk/${{ matrix.flavor }}/release/app-${{ matrix.flavor }}-release.apk

```