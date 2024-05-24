import 'package:car_rental_app/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList<Welcome> welcomeList = RxList([
    Welcome(
      image: ImageConstant.splash1,
      title: "ӨЗІҢІЗГЕ ҰНАҒАН КӨЛІКТІ ТАҢДАҢЫЗ",
      subtitle:
          "Біз сізге таңдау үшін автокөліктің әртүрлі нұсқаларын ұсынамыз.",
    ),
    Welcome(
      image: ImageConstant.splash2,
      title: "ТӨЛЕМ ЖАСАУ ЖӘНЕ КЕЛІСІМ ЖАСАУ",
      subtitle: "Сіз өзіңізге ыңғайлы уақытта онлайн немесе офлайн төлей аласыз.",
    ),
    Welcome(
      image: ImageConstant.splash3,
      title: "КӨЛІКПЕН САЯХАТТАҢЫЗ",
      subtitle:
          "qRent арқылы сіз жергілікті және қала сыртындағы сапарлар үшін автокөлікке тапсырыс бере аласыз.",
    )
  ]);
}

class Welcome {
  String title;
  String subtitle;
  String? image;
  Welcome({required this.title, required this.subtitle, this.image});
}
