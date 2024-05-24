import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:flutter/foundation.dart';

class SignupController extends GetxController {
  RxString fullname = "".obs;
  RxString fullnameError = ''.obs;
  RxString phoneNo = "".obs;
  RxString phoneNoError = ''.obs;
  RxString email = ''.obs;
  RxString emailError = ''.obs;
  RxString password = "".obs;
  RxString passwordError = ''.obs;

  RxBool isPassword = true.obs;

  RxBool tAc = false.obs;
  RxString tcError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    phoneNoError.value = '';
    tcError.value = "";
    if (fullname.isEmpty) {
      fullnameError.value = "Please enter a valid username";
      isValid.value = false;
    }
    if (email.isEmpty) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    if (phoneNo.isEmpty) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.value)) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "The password must contain at least six character";
      isValid.value = false;
    }

    if (!tAc.value) {
      tcError.value = "*Please accept Terms and Conditions to continue";
      isValid.value = false;
    }
    return isValid.value;
  }

  register() {
    if (valid()) {
      Get.toNamed(AppRoutes.bottomBarScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
