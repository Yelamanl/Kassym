import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincaode = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  RxString usernameError = ''.obs;
  RxString addressError = ''.obs;
  RxString cityError = ''.obs;
  RxString countryError = ''.obs;
  RxString pincaodeError = ''.obs;
  RxString phoneNoError = ''.obs;

  bool valid() {
    RxBool isValid = true.obs;
    usernameError.value = '';
    addressError.value = '';
    cityError.value = '';
    countryError.value = '';
    pincaodeError.value = '';
    phoneNoError.value = '';

    if (username.text.isEmpty) {
      usernameError.value = "Please enter a username";
      isValid.value = false;
    }
    if (address.text.isEmpty) {
      addressError.value = "Please enter a address";
      isValid.value = false;
    }
    if (city.text.isEmpty) {
      cityError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (country.text.isEmpty) {
      countryError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (pincaode.text.isEmpty) {
      pincaodeError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (phoneNo.text.isEmpty) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.text)) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    }

    return isValid.value;
  }

  editProfile() {
    if (valid()) {
      Get.toNamed(AppRoutes.bottomBarScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
