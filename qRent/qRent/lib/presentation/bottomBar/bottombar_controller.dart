import 'package:car_rental_app/core/app_export.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class BottomBarController extends GetxController {
  RxInt pageIndex = 0.obs;

  RxInt drawer = 0.obs;

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  List icons = [
    [ImageConstant.home, ImageConstant.activeHome],
    [ImageConstant.favorite, ImageConstant.activeFavorite],
    [ImageConstant.date, ImageConstant.activeDate],
    [ImageConstant.profile, ImageConstant.activeProfile]
  ];

  List drawerList = [
    ["Profile", ImageConstant.editperson],
    ["Address", ImageConstant.editperson],
    ["Filters", ImageConstant.filter],
    ["Payment", ImageConstant.cardpayment],
    ["Chats", ImageConstant.chat],
    ["Ride History", ImageConstant.history],
    ["Trek your car", ImageConstant.location],
    ["About us", ImageConstant.info],
    ["Logout", ImageConstant.logouticon],
  ];
}
