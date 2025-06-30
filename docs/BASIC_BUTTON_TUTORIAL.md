# 🧩 BASIC BUTTON TUTORIAL

A guide to using the BasicButton widget in your Flutter app with rich customization for style, size, icon, width, and event state.


---

## 📦 Import

```dart
import 'package:shared/shared.dart'; // Adjust based on your project structure
```

---

## 🔘 Overview

The `BasicButton` widget supports 4 types:

- `BasicButton.elevated`
- `BasicButton.filled`
- `BasicButton.outlined`
- `BasicButton.text`

It is designed to be consistent, customizable, and responsive.

---

## 🎛 Constructor Parameters

| Parameter        | Type                  | Description                              |
| ---------------- | --------------------- | ---------------------------------------- |
| `text`           | `String`              | The button label text                    |
| `onPressed`      | `void Function()`     | Callback when the button is pressed      |
| `state`          | `BasicButtonEventState` | The current state of the button          |
| `type`           | `BasicButtonType`     | The type of button (`elevated`, `filled`, `outlined`, `text`) |
| `size`           | `BasicButtonSize`     | The size of the button (`small`, `medium`, `large`) |
| `icon`           | `Widget?`             | An optional icon to display in the button |
| `isFullWidth`    | `bool`              | Whether the button should take full width |

---

## Available Sizes

| Size    | Width         | Height       |
| ------- | ------------- | ------------ |
| `small` | 64px          | 42px(min)    |
| `medium`| 72px          | 48px(min)    |
| `large` | 80px          | 54px(min)    |

---

## 🚦 States

| State        | Description                                  |
| ------------ | -------------------------------------------- |
| `active`       | Default state when the button is not pressed |
| `loading`    | Indicates the button is in a loading state   |
| `disabled`   | Indicates the button is disabled             |

---

## 🚀 Example Usages

### 🔹 Elevated Button

```dart
BasicButton.elevated(
  text: 'Elevated Button',
  onPressed: () {
    // Handle button press
  },
),
```

### 🔹 Filled Button

```dart
BasicButton.filled(
  text: 'Filled Button',
  onPressed: () {
    // Handle button press
  },
),
```

### 🔹 Outlined Button

```dart
BasicButton.outlined(
  text: 'Outlined Button',
  onPressed: () {
    // Handle button press
  },
),
```

### 🔹 Text Button

```dart
BasicButton.text(
  text: 'Text Button',
  onPressed: () {
    // Handle button press
  },
),
```

### 🔹 Full Width Button

```dart
BasicButton.elevated(
  text: 'Full Width Button',
  onPressed: () {
    // Handle button press
  },
  isFullWidth: true,
),
```

---

# 📘 Notes

Internally, each button uses the corresponding Flutter material component (ElevatedButton, FilledButton, etc).

CircularProgressIndicator is used when loading, and scales with button height.

---

Happy building! 💙