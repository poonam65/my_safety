import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appcolor.dart';
import '../../../../../widgets/button_wgt.dart';
import '../../../../../widgets/text_form_field_wgt.dart';
import '../controller/signup_controller.dart';


class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      appBar: AppBar(title: const Text("Sign Up")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [

              /// EMAIL
              TextFormFieldWgt(
                hinttext: "Email",
                controller: controller.emailController,
                prxicon: Icons.email,
                inptype: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return "Email required";
                  if (!GetUtils.isEmail(v)) return "Invalid email";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              /// PASSWORD
              Obx(() => TextFormFieldWgt(
                hinttext: "Password",
                controller: controller.passwordController,
                prxicon: Icons.lock,
                obstxt: controller.hidePassword.value,
                sfxicon: controller.hidePassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSficonTap: controller.togglePassword,
                validator: (v) {
                  if (v == null || v.isEmpty) return "Password required";
                  if (v.length < 6) return "Min 6 characters";
                  return null;
                },
              )),

              const SizedBox(height: 16),

              /// CONFIRM PASSWORD
              Obx(() => TextFormFieldWgt(
                hinttext: "Confirm Password",
                controller: controller.confirmPasswordController,
                prxicon: Icons.lock_outline,
                obstxt: controller.hideConfirmPassword.value,
                sfxicon: controller.hideConfirmPassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSficonTap: controller.toggleConfirmPassword,
                validator: (v) {
                  if (v == null || v.isEmpty) return "Confirm password required";
                  if (v != controller.passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              )),

              const SizedBox(height: 30),

              /// SIGNUP BUTTON
              Obx(() => ButtonWgt(
                text: "SIGN UP",
                isLoading: controller.isLoading.value,
                onTap: controller.signup,
                height: 48,
                color: AppColor.blueDarkColor,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
