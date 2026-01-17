import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/login/bindings/otp_binding.dart';
import '../modules/auth/login/bindings/signup_binding.dart';
import '../modules/auth/login/view/login_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/view/otp_view.dart';
import '../modules/auth/login/view/signup_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    /// LOGIN
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    /// SIGNUP
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),

    /// otp
    GetPage(
      name: Routes.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
  ];
}
