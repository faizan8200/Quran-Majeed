//packages

import 'package:get/get.dart';
import 'package:quran_app/controllers/book_controller.dart';
import 'package:quran_app/controllers/book_index_controller.dart';
import 'package:quran_app/controllers/introduction_controller.dart';
import 'package:quran_app/controllers/language_controller.dart';
import 'package:quran_app/controllers/splash_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<IntroductionController>(() => IntroductionController(), fenix: true);
    Get.lazyPut<BookController>(() => BookController(), fenix: true);
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
    Get.lazyPut<BookIndexController>(() => BookIndexController(), fenix: true);
  }
}
