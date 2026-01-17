import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load SignupController when SignupView is opened
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
