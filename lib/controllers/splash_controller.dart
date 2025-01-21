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
      bookController.init();
      //getLastReadPage
      bookController.loadLastSeenPage();
      //!SECTION Check Introscreen is first time or not
      if (global.sp!.getBool('Intro') != null) {
        intro = global.sp!.getBool('Intro');
      }
      //!SECTION
      // Handle first launch to insert images
      /* await handleFirstLaunch();
      // Fetch all images from database
      // Fetch the first 100 images
      List<Uint8List> firstBatch = await getImagesByBatch(50, 0);
      List<Uint8List> secondBatch = await getImagesByBatch(50, 50);
      List<Uint8List> thirdBatch = await getImagesByBatch(50, 100);
      List<Uint8List> fourthBatch = await getImagesByBatch(50, 150);
      List<Uint8List> fifthBatch = await getImagesByBatch(50, 200);
      List<Uint8List> sixBatch = await getImagesByBatch(50, 250);
      List<Uint8List> sevenBatch = await getImagesByBatch(50, 300);
      List<Uint8List> eightBatch = await getImagesByBatch(50, 350);
      List<Uint8List> nineBatch = await getImagesByBatch(50, 400);
      List<Uint8List> tenBatch = await getImagesByBatch(50, 450);
      List<Uint8List> elevenBatch = await getImagesByBatch(50, 500);
      List<Uint8List> twelveBatch = await getImagesByBatch(50, 550);
      List<Uint8List> thirteenBatch = await getImagesByBatch(50, 600);
      List<Uint8List> fourteenBatch = await getImagesByBatch(50, 650);
      List<Uint8List> fifteenBatch = await getImagesByBatch(50, 700);
      List<Uint8List> sixteenBatch = await getImagesByBatch(50, 750);
      List<Uint8List> seventeenBatch = await getImagesByBatch(64, 800);

      bookController.images.addAll(firstBatch);
      bookController.images.addAll(secondBatch);
      bookController.images.addAll(thirdBatch);
      bookController.images.addAll(fourthBatch);
      bookController.images.addAll(fifthBatch);
      bookController.images.addAll(sixBatch);
      bookController.images.addAll(sevenBatch);
      bookController.images.addAll(eightBatch);
      bookController.images.addAll(nineBatch);
      bookController.images.addAll(tenBatch);
      bookController.images.addAll(elevenBatch);
      bookController.images.addAll(twelveBatch);
      bookController.images.addAll(thirteenBatch);
      bookController.images.addAll(fourteenBatch);
      bookController.images.addAll(fifteenBatch);
      bookController.images.addAll(sixteenBatch);
      bookController.images.addAll(seventeenBatch); */
      //!SECTION  navigation process
      Timer(const Duration(seconds: 2), () {
        if (intro == true) {
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

  /* Future<List<Uint8List>> getImagesByBatch(int limit, int offset) async {
    final dbHelper = QuranDatabaseHelper();
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'QuranPages',
      orderBy: 'page_number ASC',
      limit: limit,
      offset: offset,
    );

    // Extract image data as a list of Uint8List
    return maps.map((e) => e['image_data'] as Uint8List).toList();
  } */
}
