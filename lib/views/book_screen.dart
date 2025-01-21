import 'dart:developer';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/constants/helper.dart';
import 'package:quran_app/constants/image_constant.dart';
import 'package:quran_app/controllers/book_controller.dart';
import 'package:quran_app/utils/list_page.dart';
import 'package:quran_app/views/book_mark_screen.dart';
import 'package:quran_app/views/setting_screen.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:quran_app/utils/global.dart' as global;

class BookScreen extends StatefulWidget {
  final int? selectedPagenumber;
  const BookScreen({
    super.key,
    this.selectedPagenumber,
  });

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  BookController bookController = Get.find<BookController>();

  @override
  void initState() {
    super.initState();
    if (widget.selectedPagenumber != null) {
      bookController.pageController =
          PageController(initialPage: widget.selectedPagenumber! - 1);
      bookController.currentPage = widget.selectedPagenumber! - 1;
    }
    if (global.sp!.getBool("isDisplayShowCase") == null ||
        global.sp!.getBool("isDisplayShowCase") == true) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context).startShowCase(
          [
            bookController.one,
            bookController.two,
            bookController.three,
            bookController.four
          ],
        ),
      );
    } else {
      log("Showcase Already Display");
    }

    bookController.init();
  }

  @override
  void dispose() {
    super.dispose();
    bookController.pageController.dispose(); // Dispose of the PageController
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (_) {
      return Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Stack(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: PageView.builder(
                  itemCount: quranIndex.pages.length,
                  controller: bookController.pageController,
                  onPageChanged: (value) => bookController.onPageChanged(value),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => bookController.tapOnBookScreen(),
                      child: Stack(
                        children: [
                          //Image Of Quran
                          MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? Center(
                                  child: Image.asset(
                                    quranIndex.pages[index].imagePath ??
                                        ImageConstant.quranImage,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    height:
                                        const Helper().getDeviceheight(context),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Center(
                                    child: Image.asset(
                                      quranIndex.pages[index].imagePath ??
                                          ImageConstant.quranImage,
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topCenter,
                                      width: const Helper()
                                          .getDevicewidth(context),
                                    ),
                                  ),
                                ),
                          /* MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? Center(
                                  child: Image.memory(
                                    bookController.images[index],
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    height:
                                        const Helper().getDeviceheight(context),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Center(
                                    child: Image.memory(
                                      bookController.images[index],
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topCenter,
                                      width:
                                          const Helper().getDevicewidth(context),
                                    ),
                                  ),
                                ), */
                          //bookmark Icon
                          Positioned(
                            right: -5,
                            child: GetBuilder<BookController>(
                                init: bookController,
                                builder: (_) {
                                  return global.sp!.getBool(
                                                  "isDisplayShowCase") ==
                                              null ||
                                          global.sp!.getBool(
                                                  "isDisplayShowCase") ==
                                              true
                                      ? Showcase(
                                          key: bookController.one,
                                          description:
                                              "Tap Ribbon to Bookmark Page",
                                          child: Image.asset(
                                            ImageConstant.bookmarkImage,
                                            height: 100,
                                            width: 40,
                                            color: quranIndex
                                                    .pages[index].isBookmark
                                                ? Colors.red.withOpacity(0.5)
                                                : Colors.grey.withOpacity(0.3),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () => bookController
                                              .bookmarkImageTap(index),
                                          child: Image.asset(
                                            ImageConstant.bookmarkImage,
                                            height: 100,
                                            width: 40,
                                            color: quranIndex
                                                    .pages[index].isBookmark
                                                ? Colors.red.withOpacity(0.5)
                                                : Colors.grey.withOpacity(0.3),
                                          ),
                                        );
                                }),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              //bookmark
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => bookController.isBookMarkSheet.value == true
                      ? bookController.modalBottomSheet(
                          typeName: "bookmark",
                          sheetTitle: "Bookmark",
                          selectdSheetValue: bookController.isBookMarkSheet,
                          hideSheet: () => bookController.hideBookmarkSheet(),
                          widgetList: [
                            BookMarkScreen(),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              //setting
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => bookController.isSettingSheet.value == true
                      ? bookController.modalBottomSheet(
                          typeName: "setting",
                          sheetTitle: "Settings",
                          selectdSheetValue: bookController.isSettingSheet,
                          hideSheet: () => bookController.hideSettingSheet(),
                          widgetList: [
                            const SettingScreen(),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              //Showcase | Tutorial First Time
              global.sp!.getBool("isDisplayShowCase") == null ||
                      global.sp!.getBool("isDisplayShowCase") == true
                  ? Positioned.fill(
                      left: 15,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Showcase(
                          key: bookController.three,
                          description: "Swipe left to right for view next page",
                          child: const Icon(
                            Icons.swipe_right,
                            size: 50,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              //Showcase | Tutorial First Time
              global.sp!.getBool("isDisplayShowCase") == null ||
                      global.sp!.getBool("isDisplayShowCase") == true
                  ? Positioned.fill(
                      left: 15,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Showcase(
                          key: bookController.four,
                          description:
                              "Swipe right to left for view previous page",
                          onBarrierClick: () {
                            ShowCaseWidget.of(context).dismiss();
                            bookController.isScreenTap = false;
                            global.sp!.setBool("isDisplayShowCase", false);
                            setState(() {});
                          },
                          onTargetClick: () {
                            ShowCaseWidget.of(context).dismiss();
                            bookController.isScreenTap = false;
                            global.sp!.setBool("isDisplayShowCase", false);
                            setState(() {});
                          },
                          disposeOnTap: true,
                          child: const Icon(
                            Icons.swipe_left,
                            size: 50,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        bottomSheet: global.sp!.getBool("isDisplayShowCase") == null ||
                global.sp!.getBool("isDisplayShowCase") == true
            ? Showcase(
                key: bookController.two,
                description: "Tap anywehere to show/hide  Menu",
                child: GetBuilder<BookController>(
                  builder: (_) {
                    return bookController.isScreenTap
                        ? Container(
                            color: AppColor.blackColor,
                            width: double.infinity, // Forces full width
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                IconButton(
                                  icon: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.menu_book,
                                        color: bookController
                                                        .selectedBottomIndex !=
                                                    null &&
                                                bookController
                                                        .selectedBottomIndex ==
                                                    0
                                            ? Theme.of(context).primaryColor
                                            : AppColor.whiteColor,
                                      ),
                                      Text(
                                        "Index",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: bookController
                                                          .selectedBottomIndex ==
                                                      0
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : AppColor.whiteColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    bookController.onTapOnBottom(0, context);
                                  },
                                ),
                                IconButton(
                                  icon: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.bookmark,
                                        color: bookController
                                                        .selectedBottomIndex !=
                                                    null &&
                                                bookController
                                                        .selectedBottomIndex ==
                                                    1
                                            ? Theme.of(context).primaryColor
                                            : AppColor.whiteColor,
                                      ),
                                      Text(
                                        "Bookmarks",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: bookController
                                                          .selectedBottomIndex ==
                                                      1
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : AppColor.whiteColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    bookController.onTapOnBottom(
                                      1,
                                      context,
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        color: bookController
                                                        .selectedBottomIndex !=
                                                    null &&
                                                bookController
                                                        .selectedBottomIndex ==
                                                    2
                                            ? Theme.of(context).primaryColor
                                            : AppColor.whiteColor,
                                      ),
                                      Text(
                                        "Settings",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: bookController
                                                          .selectedBottomIndex ==
                                                      2
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : AppColor.whiteColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    bookController.onTapOnBottom(
                                      2,
                                      context,
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              )
            : GetBuilder<BookController>(
                builder: (_) {
                  return bookController.isScreenTap
                      ? Container(
                          color: AppColor.blackColor,
                          width: double.infinity, // Forces full width
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.menu_book,
                                      color: bookController
                                                      .selectedBottomIndex !=
                                                  null &&
                                              bookController
                                                      .selectedBottomIndex ==
                                                  0
                                          ? Theme.of(context).primaryColor
                                          : AppColor.whiteColor,
                                    ),
                                    Text(
                                      "Index",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: bookController
                                                        .selectedBottomIndex ==
                                                    0
                                                ? Theme.of(context).primaryColor
                                                : AppColor.whiteColor,
                                          ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  bookController.onTapOnBottom(0, context);
                                },
                              ),
                              IconButton(
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.bookmark,
                                      color: bookController
                                                      .selectedBottomIndex !=
                                                  null &&
                                              bookController
                                                      .selectedBottomIndex ==
                                                  1
                                          ? Theme.of(context).primaryColor
                                          : AppColor.whiteColor,
                                    ),
                                    Text(
                                      "Bookmarks",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: bookController
                                                        .selectedBottomIndex ==
                                                    1
                                                ? Theme.of(context).primaryColor
                                                : AppColor.whiteColor,
                                          ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  bookController.onTapOnBottom(
                                    1,
                                    context,
                                  );
                                },
                              ),
                              IconButton(
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: bookController
                                                      .selectedBottomIndex !=
                                                  null &&
                                              bookController
                                                      .selectedBottomIndex ==
                                                  2
                                          ? Theme.of(context).primaryColor
                                          : AppColor.whiteColor,
                                    ),
                                    Text(
                                      "Settings",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: bookController
                                                        .selectedBottomIndex ==
                                                    2
                                                ? Theme.of(context).primaryColor
                                                : AppColor.whiteColor,
                                          ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  bookController.onTapOnBottom(
                                    2,
                                    context,
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : const SizedBox();
                },
              ),
      );
    });
  }
}
