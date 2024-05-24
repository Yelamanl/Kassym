import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/auth/login/login_con.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController _con = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: appBar(
            text: "",
            leading: "Артқа",
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      // const Spacer(),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image.asset(ImageConstant.login)),
                            Text(
                              "Кіру",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              'Қош келдіңіз!',
                              style: TextStyle(
                                color: AppColors.subTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.05),
                            AppTextField(
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(ImageConstant.email)),
                              hintText: "Email",
                              obsecureText: false,
                              onChange: (value) {
                                _con.email.value = value;
                                _con.emailError.value = '';
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z0-9@_.-]"),
                                ),
                              ],
                              errorMessage: _con.emailError,
                            ),
                            SizedBox(height: Get.height * 0.028),
                            Obx(
                              () => AppTextField(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(ImageConstant.password),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _con.isPassword.value =
                                        !_con.isPassword.value;
                                  },
                                  icon: Icon(
                                    _con.isPassword.value
                                        ? Icons.remove_red_eye_sharp
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Құпиясөз",
                                obsecureText: _con.isPassword.value,
                                onChange: (value) {
                                  _con.password.value = value;
                                  _con.passwordError.value = '';
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9@_.-]"),
                                  ),
                                ],
                                errorMessage: _con.passwordError,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              children: [
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      _con.isCheck.value = !_con.isCheck.value;
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        _con.isCheck.value ? Icons.check : null,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "  Сақтау",
                                  style:
                                      TextStyle(color: AppColors.subTextColor),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.forgotPasswordScreen);
                                  },
                                  child: Text(
                                    "Құпиясөзді жаңарту",
                                    style: TextStyle(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.05),
                            Center(
                              child: AppButton(
                                text: "Кіру",
                                width: Get.width / 2,
                                onPressed: () {
                                  _con.login();
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Center(
                              child: Text(
                                "немесе",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.25,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.google,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.05),
                                Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.25,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.facebook,
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.05),
                                Container(
                                  height: Get.height * 0.07,
                                  width: Get.width * 0.25,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.apple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            // onTap: () => Get.toNamed(AppRoutes.signUpScreen),
                            child: Text(
                              "Аккаунт жоқ па?".tr + ' ',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.signUpScreen),
                            child: Text(
                              "Тіркелу",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: AppColors.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
