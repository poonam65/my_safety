import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/AppSnackBar.dart';
import '../../../../data/api/auth_api.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final hidePassword = true.obs;

  final formKey = GlobalKey<FormState>();

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final result = await AuthApi.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading.value = false;

      if (result['statusCode'] == 200) {
        final body = result['body'];

        if (body['success'] == true) {
          final token = body['data']['token'];

          AppSnackBar.showSuccess(body['message']);

          /// TODO: save token
          /// GetStorage / SharedPreferences

          print("JWT TOKEN => $token");

          // Get.offAllNamed(Routes.HOME);
        } else {
          AppSnackBar.showError(body['message']);
        }
      } else {
        AppSnackBar.showError("Invalid credentials");
      }
    } catch (e) {
      isLoading.value = false;
      AppSnackBar.showError("Server not responding");
      debugPrint("LOGIN ERROR => $e");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
