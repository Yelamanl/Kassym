import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:flutter/material.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Ride History",
        leading: "back",
        action: true,
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: Get.height / 5.5,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.containerBorderColor,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Fortuner",
                      style: TextStyle(
                        color: AppColors.subTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.calandar,
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "Date: 10/10/17",
                          style: TextStyle(
                              color: AppColors.subTextColor, fontSize: 10),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.time,
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "Time: 06:25 AM",
                          style: TextStyle(
                              color: AppColors.subTextColor, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            ImageConstant.route,
                            height: 80,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Pickup point",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.subTextColor,
                                              fontWeight: FontWeight.w400)),
                                      const Text("Benar Rode, dadi Ka Phatak",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        Image.asset(ImageConstant.car2),
                                        Text("8.5 km",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.subTextColor,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Pickup point",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.subTextColor,
                                              fontWeight: FontWeight.w400)),
                                      const Text("Benar Rode, dadi Ka Phatak",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  const Text(
                                    "\$440",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
