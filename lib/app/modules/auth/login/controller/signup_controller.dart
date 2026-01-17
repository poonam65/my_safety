import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/AppSnackBar.dart';
import '../../../../data/api/auth_api.dart';
import '../../../../routes/app_routes.dart';


class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;

  final formKey = GlobalKey<FormState>();

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void toggleConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }

  void signup() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      AppSnackBar.showError("Password and Confirm Password must match");
      return;
    }

    try {
      isLoading.value = true;

      final result = await AuthApi.signup(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

      isLoading.value = false;

      if (result['statusCode'] == 200 || result['statusCode'] == 201) {
        final body = result['body'];

        if (body['success'] == true) {
          AppSnackBar.showSuccess(body['message']);

          /// Navigate to OTP screen
          Get.toNamed(
            Routes.OTP,
            arguments: {
              "email": body['data'],
            },
          );
        } else {
          AppSnackBar.showError(body['message']);
        }
      } else {
        AppSnackBar.showError("Signup failed");
      }
    } catch (e) {
      isLoading.value = false;
      AppSnackBar.showError("Server error");
      debugPrint("SIGNUP ERROR => $e");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
