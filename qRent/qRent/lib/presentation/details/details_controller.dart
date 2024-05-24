import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/features_model.dart';

class DetailsController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  var current = 0.obs;
  var isselected = 0.obs;

  RxList<Features> featuresList = RxList([
    Features(image: ImageConstant.speedometer, label: "420 km"),
    Features(image: ImageConstant.car, label: "420 km"),
    Features(image: ImageConstant.canister, label: "420 km"),
    Features(image: ImageConstant.seat, label: "420 km"),
  ]);
}
