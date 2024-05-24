import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/checkout/checkout_controller.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final CheckoutController _con = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Checkout",
        leading: "back",
        action: true,
        actionIcon: ImageConstant.notification,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: addressType,
          ),
        ),
      ),
    );
  }

  List<Widget> get addressType {
    return [
      const SizedBox(height: 10),
      progressIndicatorBar(),
      const SizedBox(height: 20),
      commanTitle(text: "Address Details"),
      const SizedBox(height: 20),
      heading("User Name"),
      AppTextField(
        border: true,
        hintText: "User Name",
        color: Colors.white,
        errorMessage: _con.usernameError,
        controller: _con.username,
        onChange: (value) {
          // _con.username.text = value.trim();
          _con.usernameError.value = '';
        },
      ),
      heading("Address"),
      AppTextField(
        border: true,
        hintText: "Address",
        color: Colors.white,
        errorMessage: _con.addressError,
        controller: _con.address,
        onChange: (value) {
          // _con.address.text = value.trim();
          _con.addressError.value = '';
        },
      ),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("City"),
                AppTextField(
                  border: true,
                  hintText: "City",
                  color: Colors.white,
                  errorMessage: _con.cityError,
                  controller: _con.city,
                  onChange: (value) {
                    // _con.city.text = value.trim();
                    _con.cityError.value = '';
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("Country"),
                AppTextField(
                  border: true,
                  hintText: "Country",
                  color: Colors.white,
                  errorMessage: _con.countryError,
                  controller: _con.country,
                  onChange: (value) {
                    // _con.country.text = value.trim();
                    _con.countryError.value = '';
                  },
                )
              ],
            ),
          ),
        ],
      ),
      heading("Pin Code"),
      AppTextField(
        border: true,
        hintText: "Pin Code",
        color: Colors.white,
        errorMessage: _con.pincaodeError,
        controller: _con.pincaode,
        onChange: (value) {
          // _con.pincaode.text = value.trim();
          _con.pincaodeError.value = '';
        },
      ),
      heading("Mobile No."),
      AppTextField(
        border: true,
        hintText: "Mobile No.",
        color: Colors.white,
        errorMessage: _con.phoneNoError,
        controller: _con.phoneNo,
        onChange: (value) {
          // _con.phoneNo.text = value.trim();
          _con.phoneNoError.value = '';
        },
      ),
      const SizedBox(height: 30),
      commanTitle(text: "Address Type"),
      const SizedBox(height: 20),
      ..._con.addressList
          .asMap()
          .map((i, value) => MapEntry(
                i,
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _con.addressType.value = i;
                          },
                          child: _con.addressType.value == i
                              ? Icon(Icons.radio_button_checked,
                                  color: AppColors.primaryColor)
                              : const Icon(Icons.radio_button_unchecked,
                                  color: Colors.grey),
                        ),
                        Text(
                          _con.addressList[i],
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.subTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .values
          .toList(),
      const SizedBox(height: 30),
      Center(
        child: AppButton(
          onPressed: () {
            _con.checkout();
          },
          width: Get.width / 2,
          text: "Save",
        ),
      ),
    ];
  }

  Stack progressIndicatorBar() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          left: 10,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: 2,
            width: Get.width,
            color: AppColors.containerBorderColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              progressBar(
                  text: "Card",
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
              progressBar(
                  text: "Address",
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
              progressBar(
                  text: "Payment",
                  color: Colors.white,
                  textColor: AppColors.subTextColor,
                  bordercolor: AppColors.containerBorderColor),
            ],
          ),
        ),
      ],
    );
  }

  Column progressBar({
    String? text,
    Color? color,
    Color? textColor,
    Color? bordercolor,
  }) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: bordercolor!)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text!,
          style: TextStyle(color: textColor),
        )
      ],
    );
  }
}
