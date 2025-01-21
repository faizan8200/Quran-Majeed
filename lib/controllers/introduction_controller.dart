import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/image_constant.dart';
import 'package:quran_app/models/introduction_model.dart';
import 'package:quran_app/utils/global.dart' as global;
import 'package:quran_app/views/book_screen.dart';
import 'package:showcaseview/showcaseview.dart';

class IntroductionController extends GetxController {
//class Name
  String className = "introduction_controller.dart";
//int
  int currentIndex = 0.obs();

//controller
  PageController? pageController = PageController(initialPage: 0);
//model:

//list:
  List<IntroductionModel> introList = [
    IntroductionModel(
      title: "Read Quran",
      description:
          "The quran in multitude of language. You can read Quran in your language",
      imagePath1: ImageConstant.introBookImageOne,
      imagePath2: ImageConstant.introStarImage,
    ),
    IntroductionModel(
      title: "Bookmark Quran",
      description:
          "The quran in multitude of language. You can read Quran in your language",
      imagePath1: ImageConstant.introBookImageOne,
      imagePath2: ImageConstant.introStarImage,
    ),
    IntroductionModel(
      title: "Search Quran",
      description:
          "The quran in multitude of language. You can read Quran in your language",
      imagePath1: ImageConstant.introBookImageOne,
      imagePath2: ImageConstant.introStarImage,
    ),
  ];
//bool

  Future<void> init() async {
    try {} catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }

  onPageChanged(int index) {
    try {
      currentIndex = index;
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "onPageChanged",
          e: e);
    }
  }

  onDone() {
    try {
      if (pageController!.page == 2) {
        Get.offUntil(
          GetPageRoute(
            page: () => ShowCaseWidget(
              builder: (context) {
                return const BookScreen();
              }
            ),
            routeName: "/BookScreen",
            transition: Transition.zoom,
            transitionDuration: global.navigationDuration,
          ),
          (route) => route.settings.name == '/BookScreen',
        );
      } else {
        pageController!
            .nextPage(duration: 300.milliseconds, curve: Curves.ease);
      }
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "onDone",
          e: e);
    }
  }
}
