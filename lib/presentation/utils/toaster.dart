import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/edge_insets_ext.dart';
import 'package:flutter_clean_blox_template/presentation/utils/spacer_ext.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

extension Toaster on BuildContext {
  void showToastSuccess(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        padding: 8.edgeAll,
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            8.paddingX,
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToastError(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        padding: 8.edgeAll,
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            8.paddingX,
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToastInfo(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        padding: 8.edgeAll,
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            8.paddingX,
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToastWarning(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        padding: 8.edgeAll,
        content: Row(
          children: [
            const Icon(Icons.warning, color: Colors.white),
            8.paddingX,
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToasterErrorValidator({
    required String field,
    required String message,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        padding: 8.edgeAll,
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            8.paddingX,
            Expanded(
              child: Text(
                '$field: $message',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
