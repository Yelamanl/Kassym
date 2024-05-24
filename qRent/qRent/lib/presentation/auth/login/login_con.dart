import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:flutter/foundation.dart';

class LoginController extends GetxController {
  RxString password = ''.obs;
  RxString passwordError = ''.obs;
  RxString email = ''.obs;
  RxString emailError = ''.obs;

  RxBool isPassword = true.obs;
  RxBool isCheck = true.obs;

  bool valid() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Дұрыс поштаңызды жазыңыз";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Дұрыс поштаңызды жазыңыз";
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "Дұрыс құпиясөзді жазыңыз";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "Құпиясөз 6 символды қамту қажет";
      isValid.value = false;
    }
    return isValid.value;
  }

  login() {
    if (valid()) {
      Get.toNamed(AppRoutes.bottomBarScreen);
    } else {
      if (kDebugMode) {
        print("Дұрыс емес");
      }
    }
  }
}
