import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:car_rental_app/presentation/editProfile/edit_profile_controller.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController _con = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 15, bottom: 2, right: 0, top: 2),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        title: const Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.asset(ImageConstant.edit),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: Get.height / 3.8,
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Get.height * .14,
                      width: Get.height * .14,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        "https://static.toiimg.com/thumb/msid-68865435,width-800,height-600,resizemode-75,imgsize-179723,pt-32,y_pad-40/68865435.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Andrey Thompson"),
                  const Text("andreythompson0145@gmail.com")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commanTitle(text: "Your Details"),
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
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: AppButton(
                      onPressed: () {
                        _con.editProfile();
                      },
                      width: Get.width / 2,
                      text: "Save",
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.subTextColor,
        ),
      ),
    );
  }
}
