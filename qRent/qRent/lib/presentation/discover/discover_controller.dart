import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/brands_model.dart';
import 'package:flutter/material.dart';

class DiscoverController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Brands> brandsList = RxList([
    Brands(image: ImageConstant.jaguar),
    Brands(image: ImageConstant.kia),
    Brands(image: ImageConstant.hundai),
    Brands(image: ImageConstant.toyota),
  ]);
}
