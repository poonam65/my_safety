import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appcolor.dart';
import '../../../../../widgets/button_wgt.dart';
import '../../../../../widgets/text_form_field_wgt.dart';
import '../controller/otp_controller.dart';


class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Enter OTP sent to ${controller.email}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            TextFormFieldWgt(
              hinttext: "OTP",
              controller: controller.otpController,
              inptype: TextInputType.number,
            ),

            const SizedBox(height: 30),

            Obx(() => ButtonWgt(
              text: "VERIFY OTP",
              isLoading: controller.isLoading.value,
              onTap: controller.verifyOtp,
              height: 48,
              color: AppColor.blueDarkColor,
            )),
          ],
        ),
      ),
    );
  }
}
