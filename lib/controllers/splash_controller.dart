import 'dart:async';
import 'package:get/get.dart';
import 'package:quran_app/controllers/book_controller.dart';
import 'package:quran_app/utils/global.dart' as global;
import 'package:quran_app/views/book_screen.dart';
import 'package:showcaseview/showcaseview.dart';

class SplashController extends GetxController {
//class Name
  String className = "splash_controller.dart";
//controller

//model:

//list:

//bool

//other
  BookController bookController = Get.find<BookController>();

  bool? intro = true;

  Future<void> init() async {
    try {
      //!SECTION load PDF
      await bookController.init();
      //getLastReadPage
      await bookController.loadLastSeenPage();
      //enable disable wake lock based on stored preference
      await bookController.checkWakeLock();
      //!SECTION Check Introscreen is first time or not
      if (global.sp!.getBool('Intro') != null) {
        intro = global.sp!.getBool('Intro');
      }
      //!SECTION  navigation process
      Timer(const Duration(seconds: 2), () {
        if (intro == true) {
          Get.offUntil(
            GetPageRoute(
              page: () => ShowCaseWidget(builder: (context) {
                return const BookScreen();
              }),
              routeName: "/BookScreen",
              transition: Transition.zoom,
              transitionDuration: global.navigationDuration,
            ),
            (route) => route.settings.name == '/BookScreen',
          );
          /* Get.off(
            () => const IntroductionScreen(),
            routeName: "IntroductionScreen",
            transition: global.navigationAnimation,
            duration: global.navigationDuration,
          ); */
        }
      });
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }
}
