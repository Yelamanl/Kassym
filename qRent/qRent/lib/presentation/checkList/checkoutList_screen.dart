import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:flutter/material.dart';

class CheckoutListScreen extends StatelessWidget {
  const CheckoutListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        actionIcon: ImageConstant.notification,
        text: "Checkout List",
        leading: "back",
        action: true,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            progressIndicatorBar(),
            const SizedBox(height: 20),
            commanTitle(text: "Summary"),
            const SizedBox(height: 20),
            summary(),
            const SizedBox(height: 20),
            fromTo(),
            const SizedBox(height: 20),
            invoice(detail: "Per Day", price: "\$580"),
            const SizedBox(height: 5),
            invoice(detail: "Trip Fee", price: "\$76"),
            const SizedBox(height: 5),
            invoice(detail: "Discount", price: "10% Off"),
            const SizedBox(height: 5),
            invoice(detail: "Promo Code", price: "Insert Code"),
            const SizedBox(height: 5),
            Divider(color: AppColors.containerBorderColor),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$590",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                callButton(),
                AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.thankYouScreen);
                  },
                  width: Get.width / 2,
                  text: "Save",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container fromTo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: Get.width,
      height: Get.height / 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.4,
            ),
            blurRadius: 1.20,
            offset: const Offset(0.5, 0.6),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    "Fri,29 Jan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "10:00",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Image.asset(ImageConstant.fromTo),
              Column(
                children: [
                  const Text(
                    "Sun, 31 Jan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "13:30",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(ImageConstant.location2),
              Text(
                "  Aliso Siantar, SF 214586",
                style: TextStyle(
                  color: AppColors.subTextColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row summary() {
    return Row(
      children: [
        Image.asset(ImageConstant.fortunercar),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fortuner",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Tesla Model s Plaid",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            Text(
              "100+ Trips",
              style: TextStyle(
                  color: AppColors.subTextColor, fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }

  ElevatedButton callButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 40.0,
            maxHeight: 50.0,
          ),
          width: Get.width / 2.5,
          alignment: Alignment.center,
          child: Image.asset(
            ImageConstant.call,
            height: 20,
          ),
        ),
      ),
    );
  }

  Row invoice({String? detail, String? price}) {
    return Row(
      children: [
        Text(
          detail!,
          style: TextStyle(color: AppColors.subTextColor),
        ),
        const Spacer(),
        Text(
          price!,
          style: TextStyle(color: AppColors.primaryColor),
        )
      ],
    );
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
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
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
