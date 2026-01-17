import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/AppSnackBar.dart';
import '../../../../data/api/auth_api.dart';
import '../../../../routes/app_routes.dart';


class OtpController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;

  late String email; // Email received from Signup screen

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email']; // Get email from previous page
  }

  void verifyOtp() async {
    if (otpController.text.isEmpty) {
      AppSnackBar.showError("Please enter OTP");
      return;
    }

    try {
      isLoading.value = true;

      final result = await AuthApi.verifyOtp(
        email: email,
        otp: otpController.text.trim(),
      );

      isLoading.value = false;

      if (result['statusCode'] == 200) {
        final body = result['body'];

        if (body['success'] == true) {
          AppSnackBar.showSuccess(body['message']);

          // OTP verified → Navigate to login
          Get.offAllNamed(Routes.LOGIN);
        } else {
          AppSnackBar.showError(body['message']);
        }
      } else {
        AppSnackBar.showError("OTP verification failed");
      }
    } catch (e) {
      isLoading.value = false;
      AppSnackBar.showError("Server error");
      debugPrint("OTP ERROR => $e");
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
