import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/models/bookmark_model.dart';
import 'package:quran_app/models/quran_model.dart';
import 'package:quran_app/models/setting_model.dart';
import 'package:quran_app/utils/global.dart' as global;
import 'package:quran_app/utils/list_page.dart';
import 'package:quran_app/views/aboutus_screen.dart';
import 'package:quran_app/views/book_index_screen.dart';
import 'package:quran_app/views/language_screen.dart';
import 'package:quran_app/views/quick_quide_screen.dart';
import 'package:quran_app/widgets/main_body_padding.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class BookController extends GetxController {
//class Name
  String className = "book_controller.dart";
//int
  int? selectedBottomIndex;
  int currentPage = 0;
//controller
  PageController pageController = PageController(initialPage: 0);
//string
  String? localFilePath = "";
  static const String bookmarkKey = "bookmarkedPages";
  static const String lastPageKey = "lastPageKey";

//model:
  BookMarkModel bookMarkModel = BookMarkModel();
//list:
  List<SettingModel> settingList = [
    SettingModel(id: 1, icon: Icons.translate, title: "Language"),
    SettingModel(id: 1, icon: Icons.emoji_objects_outlined, title: "Screen On"),
    SettingModel(id: 1, icon: Icons.info_outline_rounded, title: "Quick Guide"),
    SettingModel(id: 1, icon: Icons.info_outline_rounded, title: "About Us"),
    SettingModel(id: 1, icon: Icons.link, title: "Web Link"),
  ];

//bool
  RxBool isBookMarkSheet = false.obs;
  RxBool isSettingSheet = false.obs;
  bool isScreenTap = true;
  bool isScreenOn = true;
  // bool isShowSwipeIcon = true;

//other
  // List<Uint8List> images = [];
  GlobalKey one = GlobalKey();
  GlobalKey two = GlobalKey();
  GlobalKey three = GlobalKey();
  GlobalKey four = GlobalKey();
  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

//!------------------------------------------------------  Function -----------------------------------------------------------------

  Future<void> init() async {
    try {
      //bookmark
      bookMarkModel.bookmarkPageList = await loadBookmarks();
      // Create a Map for quick lookup of bookmark status by page number
      var bookmarkMap = {
        for (var page in bookMarkModel.bookmarkPageList!)
          page.pageNumber: page.isBookmark
      };
      // Update the main list with bookmark status
      for (var page in quranIndex.pages) {
        page.isBookmark = bookmarkMap[page.pageNumber] ?? false;
      }
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }

  void bookmarkImageTap(int index) async {
    try {
      quranIndex.pages[index].isBookmark = !quranIndex.pages[index].isBookmark;
      await toggleBookmark(quranIndex.pages[index]);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "bookmarkImageTap",
          e: e);
    }
  }

  void tapOnSavedbookmark(int page) {
    try {
      onPageChanged(page);
      pageController.jumpToPage(page);
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "tapOnSavedbookmark",
          e: e);
    }
  }

  void onPageChanged(int page) {
    try {
      currentPage = page; // Update the current page
      saveLastSeenPage(currentPage);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "onPageChanged",
          e: e);
    }
  }

  // Save the updated list of bookmarked pages
  Future<void> saveBookmarks(List<PageInfo> bookmarkedPages) async {
    try {
      final jsonList =
          bookmarkedPages.map((page) => jsonEncode(page.toJson())).toList();
      await global.sp!.setStringList(bookmarkKey, jsonList);
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "saveBookmarks",
          e: e);
    }
  }

  // Load the list of bookmarked pages
  Future<List<PageInfo>> loadBookmarks() async {
    try {
      final jsonList = global.sp!.getStringList(bookmarkKey) ?? [];
      return jsonList
          .map((jsonString) => PageInfo.fromJson(jsonDecode(jsonString)))
          .toList();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "loadBookmarks",
          e: e);
      return [];
    }
  }

  // Toggle bookmark for a specific page
  Future<void> toggleBookmark(PageInfo page) async {
    try {
      bookMarkModel.bookmarkPageList = await loadBookmarks();
      if (page.isBookmark) {
        bookMarkModel.bookmarkPageList!.add(page);
      } else {
        bookMarkModel.bookmarkPageList!
            .removeWhere((test) => test.pageNumber == page.pageNumber);
      }
      await saveBookmarks(bookMarkModel.bookmarkPageList!);
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "toggleBookmark",
          e: e);
    }
  }

  Future removeBookmarPage(int index, PageInfo page) async {
    try {
      bookMarkModel.bookmarkPageList!
          .removeWhere((test) => test.pageNumber == page.pageNumber);
      quranIndex.pages
          .firstWhere((test) => test.pageNumber == page.pageNumber)
          .isBookmark = false;
      await saveBookmarks(bookMarkModel.bookmarkPageList!);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "removeBookmarPage",
          e: e);
    }
  }

  Future onTapOnBottom(int index, BuildContext context) async {
    try {
      selectedBottomIndex = index;
      if (index == 0) {
        return Get.to(
          () => BookIndexScreen(
            selectedJuz: quranIndex.pages[currentPage].juz,
            selectedSurahIndex: quranIndex.pages[currentPage].surahNumber,
            selectedAyah: quranIndex.pages[currentPage].startAyah,
            selectedPage: quranIndex.pages[currentPage].pageNumber! - 1,
          ),
          transition: Transition.leftToRight,
          duration: global.navigationDuration,
        );
      } else if (index == 1) {
        isBookMarkSheet.value = !isBookMarkSheet.value;
        if (isBookMarkSheet.value == true) {
          // bookMarkModel.bookmarkPageList = await loadBookmarks();
          openBookmarkSheet();
          hideSettingSheet();
        } else {
          hideBookmarkSheet();
        }
      } else if (index == 2) {
        isSettingSheet.value = !isSettingSheet.value;
        if (isSettingSheet.value == true) {
          openSettingSheet();
          hideBookmarkSheet();
        } else {
          hideSettingSheet();
        }
      }
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "onTapOfBottom",
          e: e);
    }
  }

  tapOnBookScreen() {
    try {
      isScreenTap = !isScreenTap;
      clearSelectedBottomIndex();
      hideBookmarkSheet();
      hideSettingSheet();
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "tapOnBookScreen",
          e: e);
    }
  }

  clearSelectedBottomIndex() {
    try {
      selectedBottomIndex = null;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "clearSelectedBottomIndex",
          e: e);
    }
  }

  hideBookmarkSheet() {
    try {
      isBookMarkSheet.value = false;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "hideBookmarkSheet",
          e: e);
    }
  }

  hideSettingSheet() {
    try {
      isSettingSheet.value = false;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "hideSettingSheet",
          e: e);
    }
  }

  openBookmarkSheet() {
    try {
      isBookMarkSheet.value = true;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "openBookmarkSheet",
          e: e);
    }
  }

  openSettingSheet() {
    try {
      isSettingSheet.value = true;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "openSettingSheet",
          e: e);
    }
  }

  onTapOfSetting(int index) {
    try {
      switch (index) {
        case 0:
          //redirect to language Screen
          Get.to(
            () => const LanguageScreen(),
            transition: global.navigationAnimation,
            duration: global.navigationDuration,
          );
          break;
        case 1:
          //make validation of scren on
          break;
        case 2:
          //redirect user to quick Guide Screen
          Get.to(
            () => const QuickGuideScreen(),
            transition: global.navigationAnimation,
            duration: global.navigationDuration,
          );
          break;
        case 3:
          //redirect user to about us screen
          Get.to(
            () => const AboutusScreen(),
            transition: global.navigationAnimation,
            duration: global.navigationDuration,
          );
          break;
        case 4:
          //lunch url of web site
          global.website(global.websiteUrl);
          break;
        default:
      }
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "onTapOfSetting",
          e: e);
    }
  }

  Widget modalBottomSheet({
    required String typeName,
    required String sheetTitle,
    required RxBool selectdSheetValue,
    required void Function()? hideSheet,
    required List<Widget> widgetList,
  }) {
    try {
      return NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          if (notification.extent <= notification.minExtent) {
            selectdSheetValue.value = false;
          }
          return true;
        },
        child: DraggableScrollableSheet(
          initialChildSize: 0.5, // Initial height of the sheet
          minChildSize: 0.2, // Minimum height of the sheet
          maxChildSize:
              typeName == "bookmark" ? 0.8 : 0.6, // Maximum height of the sheet
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColor.sheetBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, -5), // Shadow at the top
                  ),
                ],
              ),
              child: MainBodyPadding(
                bottom: 0,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Row(
                        children: [
                          width50,
                          Expanded(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                sheetTitle,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.displaySmall!,
                              ),
                              height10,
                              Container(
                                height: 5,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          )),
                          InkWell(
                            onTap: hideSheet,
                            child: SizedBox(
                              width: 50,
                              child: Icon(
                                Icons.expand_circle_down_outlined,
                                size: 35,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned.fill(
                      top: 60,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widgetList,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

  Future<void> loadLastSeenPage() async {
    try {
      currentPage = global.sp!.getInt('lastSeenPage') ?? 0;
      pageController = PageController(initialPage: currentPage);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "loadLastSeenPage",
          e: e);
    }
  }

  Future<void> saveLastSeenPage(int page) async {
    try {
      await global.sp!.setInt('lastSeenPage', page);
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "saveLastSeenPage",
          e: e);
    }
  }

  void toggleWakelock(value) {
    try {
      isScreenOn = value;
      WakelockPlus.toggle(enable: isScreenOn);
      update();
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "toggleWakelock",
          e: e);
    }
  }
}
