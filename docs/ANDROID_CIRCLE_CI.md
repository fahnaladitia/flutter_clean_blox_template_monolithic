## CircleCI Configuration for Building Signed APKs
This configuration file is designed to build signed APKs for an Android application using CircleCI. It supports multiple flavors of the application, allowing you to specify which flavor to build at runtime. The configuration includes steps for checking out the code, installing dependencies, analyzing the code, running tests, decoding the keystore, generating the `key.properties` file, and finally building the APK for the specified flavor.

---

```yml
version: 2.1

executors:
  flutter:
    docker:
      - image: cirrusci/flutter:stable
    working_directory: ~/repo

jobs:
  build_signed_apk:
    executor: flutter
    parameters:
      flavor:
        type: string

    steps:
      - checkout

      - run:
          name: Install Dependencies
          command: flutter pub get

      - run:
          name: Check Flutter Version
          command: flutter --version

      - run:
          name: Analyze Code
          command: flutter analyze

      - run:
          name: Run Tests
          command: flutter test

      - run:
          name: Decode Keystore from Secret
          command: |
            echo $ANDROID_KEYSTORE | base64 -d > android/app/keystore.jks

      - run:
          name: Generate key.properties
          command: |
            echo "storePassword=$KEYSTORE_PASSWORD" > android/key.properties
            echo "keyPassword=$ANDROID_ALIAS_PASSWORD" >> android/key.properties
            echo "keyAlias=$ANDROID_ALIAS" >> android/key.properties
            echo "storeFile=keystore.jks" >> android/key.properties

      - run:
          name: Build APK Flavor
          command: |
            FLAVOR=${BUILD_FLAVOR}
            echo "Building APK for flavor: $FLAVOR"
            flutter build apk \
              --obfuscate \
              --split-debug-info=out/android \
              --no-tree-shake-icons \
              --flavor $FLAVOR \
              -t lib/main_$FLAVOR.dart

      - store_artifacts:
          path: build/app/outputs/apk/<< parameters.flavor >>/release/
          destination: << parameters.flavor >>-release-apk

workflows:
  version: 2
  android-release-ci:
    jobs:
      - build_signed_apk:
          name: build-${BUILD_FLAVOR}-apk
          flavor: ${BUILD_FLAVOR}
          filters:
            branches:
              only:
                - main
                - dev
            tags:
              ignore: /.*/

```