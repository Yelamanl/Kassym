import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final DetailsController _con = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Ақпарат",
        actionIcon: ImageConstant.notification,
        action: true,
        leading: "Артқа",
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                  height: Get.height / 4,
                  width: Get.width,
                  color: Colors.amber,
                  child: Image.asset(
                    ImageConstant.fortunercar,
                  )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => indicator(index, _con.currentCarouselIndex.value),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Mercedes S63 AMG",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        "2021",
                        style: TextStyle(
                            color: AppColors.subTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      RatingBar.builder(
                        unratedColor: Colors.grey,
                        itemSize: 20,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,

                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        "5.0(70 пікір)",
                        style: TextStyle(color: AppColors.subTextColor),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              commonTitle(title: "Мәліметтер"),
              const SizedBox(height: 10),
              Row(children: [
                ..._con.featuresList
                    .asMap()
                    .map((index, value) {
                      return MapEntry(
                          index,
                          Container(
                            margin: const EdgeInsets.all(4),
                            height: 50,
                            width: Get.width / 4 - 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  _con.featuresList[index].image!,
                                  // height: 40,
                                  // width: 40,
                                ),
                                Text(
                                  _con.featuresList[index].label!,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ],
                            ),
                          ));
                    })
                    .values
                    .toList(),
              ]),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text(
                    "Ақпарат",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea ipsam consequat.",
                style: TextStyle(color: AppColors.subTextColor, fontSize: 12),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text(
                    "Түсін таңдау",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [


                  colorsbar(const Color(0xff232D40), 1),
                  const Padding(padding: EdgeInsets.only(left: 2)),
                  colorsbar(Colors.white, 2),

                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "20 000 тг",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "/күніне",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                    text: "Брондау",
                    width: Get.width / 3,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  indicator(
    int index,
    int value,
  ) {
    return Obx(
      () => Container(
        height: 8,
        width: index == _con.currentIndex.value ? 20 : 8,
        margin: const EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
            color: index == _con.currentIndex.value
                ? AppColors.primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  Widget commonTitle({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(
            AppRoutes.seeAllScreen,
          ),
          child: Container(
            width: 60.0,
            alignment: Alignment.centerRight,
            child: const Text(
              "Толық қарау",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget colorsbar(Color color, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _con.isselected.value = index;
        },
        child: Container(
            height: 35,
            width: 35,
            child: Center(
                child: CircleAvatar(
                    radius: _con.isselected.value == index ? 14 : 11,
                    backgroundColor: color)),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: _con.isselected.value == index
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                    width: 3))),
      ),
    );
  }
}
