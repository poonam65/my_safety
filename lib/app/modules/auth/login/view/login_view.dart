import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../../../../../widgets/appcolor.dart';
import '../../../../../widgets/button_wgt.dart';
import '../../../../../widgets/text_form_field_wgt.dart';
import '../controller/login_controller.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blueDarkColor,
                  ),
                ),

                const SizedBox(height: 30),

                /// EMAIL
                TextFormFieldWgt(
                  hinttext: "Email",
                  controller: controller.emailController,
                  prxicon: Icons.email,
                  inptype: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Email required";
                    }
                    if (!GetUtils.isEmail(v)) {
                      return "Invalid email";
                    }
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
                    if (v == null || v.isEmpty) {
                      return "Password required";
                    }
                    if (v.length < 6) {
                      return "Min 6 characters";
                    }
                    return null;
                  },
                )),

                const SizedBox(height: 30),

                /// LOGIN BUTTON
                Obx(() => ButtonWgt(
                  text: "LOGIN",
                  isLoading: controller.isLoading.value,
                  onTap: controller.login,
                  height: 48,
                  color: AppColor.blueDarkColor,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
