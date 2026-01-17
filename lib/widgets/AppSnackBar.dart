import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class AppSnackBar {

  static void show({
    required bool isSuccess,
    required String message,
  }) {
    Get.snackbar(
      isSuccess ? "Success" : "Error",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: 8,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }

  static void showSuccess(String message) => show(isSuccess: true, message: message);
  static void showError(String message) => show(isSuccess: false, message: message);
}
