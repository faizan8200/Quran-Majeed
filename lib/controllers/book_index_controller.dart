import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/book_controller.dart';
import 'package:quran_app/utils/global.dart' as global;
import 'package:quran_app/utils/list_page.dart';
import 'package:quran_app/views/book_screen.dart';

class BookIndexController extends GetxController {
//class Name
  String className = "book_index_controller.dart";
//int
  int selectedJuz = 0;
  int selectedSurahIndex = 0;
  int selectedAyah = 0;
  int selectedPage = 0;
//controller
  FixedExtentScrollController? juzScrollController =
      FixedExtentScrollController();
  FixedExtentScrollController? surahScrollController =
      FixedExtentScrollController();
  FixedExtentScrollController? ayahScrollController =
      FixedExtentScrollController();
  FixedExtentScrollController? pageScrollController =
      FixedExtentScrollController();
  BookController bookController = Get.find<BookController>();
//model:

//list:

//bool
  bool isScrolling = false;
  Future<void> init(
      {@required int? tempSelectedJuz,
      @required int? tempSelectedSurahIndex,
      @required int? tempSelectedAyah,
      @required int? tempSelectedPage}) async {
    try {
      selectedJuz = tempSelectedJuz ?? 0;
      selectedSurahIndex = tempSelectedSurahIndex ?? 0;
      selectedAyah = tempSelectedAyah ?? 0;
      selectedPage = tempSelectedPage ?? 0;
      juzScrollController =
          FixedExtentScrollController(initialItem: selectedJuz);
      surahScrollController =
          FixedExtentScrollController(initialItem: selectedSurahIndex);
      ayahScrollController =
          FixedExtentScrollController(initialItem: selectedAyah);
      pageScrollController =
          FixedExtentScrollController(initialItem: selectedPage);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }

  void navigateToSelectedPage() {
    try {
      bookController.saveLastSeenPage(
          (quranIndex.pages[selectedPage].pageNumber ?? 1) - 1);
      Get.offAll(
        () => BookScreen(
            selectedPagenumber: quranIndex.pages[selectedPage].pageNumber),
        routeName: "/BookScreen",
        transition: Transition.rightToLeft,
        duration: global.navigationDuration,
      );
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "navigateToSelectedPage",
          e: e);
    }
  }

  void syncPickers({
    int? selectedJuz,
    int? selectedSurah,
    int? selectedAyah,
    int? selectedPage,
  }) {
    try {
      if (isScrolling) return; // Prevent overlapping scrolls
      isScrolling = true;
      selectedJuz != null ? juzScrollController!.jumpToItem(selectedJuz) : null;
      selectedSurah != null
          ? surahScrollController!.jumpToItem(selectedSurah)
          : null;
      selectedAyah != null
          ? ayahScrollController!.jumpToItem(selectedAyah)
          : null;
      selectedPage != null
          ? pageScrollController!.jumpToItem(selectedPage)
          : null;
      isScrolling = false; // Unlock after scrolling
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "syncPickers",
          e: e);
    }
  }
}
