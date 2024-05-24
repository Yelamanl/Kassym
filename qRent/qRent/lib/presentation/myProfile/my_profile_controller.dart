import 'package:car_rental_app/core/app_export.dart';

class MyProfileController extends GetxController {
  RxList<MyProfile> myProfileList = RxList([
    MyProfile(image: ImageConstant.editprofile, text: "Профиль өзгерту"),
    MyProfile(image: ImageConstant.carmodel, text: "Жүру тарихы"),
    MyProfile(image: ImageConstant.policies, text: "Келісім шарттар"),
    MyProfile(image: ImageConstant.card, text: "Төлем карталары"),
    MyProfile(image: ImageConstant.setting, text: "Баптаулар"),
  ]);
}

class MyProfile {
  String? image;
  String? text;

  MyProfile({
    this.image,
    this.text,
  });
}
