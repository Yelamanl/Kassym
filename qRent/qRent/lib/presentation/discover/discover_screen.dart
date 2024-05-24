import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/book_now.dart';
import 'package:car_rental_app/presentation/discover/discover_controller.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  final DiscoverController _con = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _searchBox(),
              const SizedBox(height: 10),
              commonTitle(title: "Көлік маркалары"),
              brandCatagory(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [car(), car()],
              ),
              const SizedBox(height: 10),
              commonTitle(
                  title: "Бос көліктер",
                  func: () {
                    Get.toNamed(AppRoutes.availableCarsScreen);
                  }),
              const SizedBox(height: 10),
              availableCar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget availableCar() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: Get.height * .25,
        width: Get.width - 30,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBorderColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
                child: Image.asset(
              ImageConstant.fortunercar,
              fit: BoxFit.cover,
              width: Get.width / 2,
            )),
            SizedBox(
              width: Get.width / 2 - 42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.secondaryColor),
                        child: Image.asset(
                          ImageConstant.fav,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Mercedes S63 AMG",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "2021",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(ImageConstant.car),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Автомат",
                            style: TextStyle(
                                color: AppColors.subTextColor, fontSize: 10),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Image.asset(ImageConstant.seat),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5 орын",
                            style: TextStyle(
                                color: AppColors.subTextColor, fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "20 000 тг",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "/күніне",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Брондау",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: _con.searchController,
        onSubmitted: (searchInfo) {},
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
            isDense: true,
            hintText: "Іздеу",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
            prefixIcon: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.searchScreen);
                },
                child: Image.asset(ImageConstant.search)),
            focusColor: Colors.grey[400],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1))),
      ),
    );
  }

  Widget commonTitle({String? title, Function()? func}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: func,
          child: Container(
            width: 60.0,
            alignment: Alignment.centerRight,
            child: const Text(
              "Барлығы",
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

  Widget brandCatagory() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _brandList(image: _con.brandsList[index].image),
        itemCount: _con.brandsList.length,
        cacheExtent: 99,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget _brandList({
    String? image,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: AppColors.containerBorderColor),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
            ),
          ],
        ),
        width: 100,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
            )
          ],
        ),
      ),
    );
  }
}
