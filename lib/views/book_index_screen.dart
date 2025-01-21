import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/constants/helper.dart';
import 'package:quran_app/controllers/book_index_controller.dart';
import 'package:quran_app/demo/demo_screen.dart';
import 'package:quran_app/utils/list_page.dart';

class BookIndexScreen extends StatefulWidget {
  final int? selectedJuz;
  final int? selectedSurahIndex;
  final int? selectedAyah;
  final int? selectedPage;

  const BookIndexScreen({
    super.key,
    this.selectedJuz,
    this.selectedSurahIndex,
    this.selectedAyah,
    this.selectedPage,
  });

  @override
  State<BookIndexScreen> createState() => _BookIndexScreenState();
}

class _BookIndexScreenState extends State<BookIndexScreen> {
  final BookIndexController bookIndexController =
      Get.find<BookIndexController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      bookIndexController.init(
        tempSelectedJuz: widget.selectedJuz,
        tempSelectedSurahIndex: widget.selectedSurahIndex,
        tempSelectedAyah: widget.selectedAyah,
        tempSelectedPage: widget.selectedPage,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    bookIndexController.juzScrollController!.dispose();
    bookIndexController.surahScrollController!.dispose();
    bookIndexController.ayahScrollController!.dispose();
    bookIndexController.pageScrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        surfaceTintColor: Theme.of(context).primaryColor,
        leadingWidth: 35,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.whiteColor,
          ),
        ),
        title: InkWell(
          onTap: () => Get.to(() => const DemoScreen()),
          child: const Text(
            "Main Index",
            style: TextStyle(color: AppColor.whiteColor),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => bookIndexController.navigateToSelectedPage(),
            icon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.whiteColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          //juz column
          Container(
            width: 45,
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 35,
                  diameterRatio: const Helper().getDeviceheight(context),
                  squeeze: 1,
                  selectionOverlay: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Colors.white.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    /* child: Text(
                      "${quranIndex.juz[bookIndexController.selectedJuz].juz}",
                      // "${bookIndexController.selectedJuz + 1}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColor.whiteColor,
                      ),
                    ), */
                  ),
                  scrollController: bookIndexController.juzScrollController,
                  onSelectedItemChanged: (int index) {
                    if (bookIndexController.isScrolling) return;
                    bookIndexController.selectedJuz = index;

                    bookIndexController.selectedSurahIndex = quranIndex.surahs
                        .indexWhere((surah) =>
                            surah.name == quranIndex.juz[index].surahs[0].name);

                    bookIndexController.selectedAyah = quranIndex
                                .juz[index].surahs[0].ayahs[0].ayahNumber !=
                            null
                        ? quranIndex.juz[index].surahs[0].ayahs[0].ayahNumber! -
                            1
                        : 0;

                    bookIndexController.selectedPage =
                        quranIndex.juz[index].pages[0].pageNumber! - 1;

                    bookIndexController.syncPickers(
                        selectedSurah: bookIndexController.selectedSurahIndex,
                        selectedAyah: bookIndexController.selectedAyah,
                        selectedPage: bookIndexController.selectedPage);

                    setState(() {});
                  },
                  children: List.generate(
                    quranIndex.juz.length,
                    (index) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${quranIndex.juz[index].juz}",
                        // "${index + 1}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColor.whiteColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    color: Colors.black.withOpacity(0.7),
                    child: const Text(
                      "Juz",
                      style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //surah column
          Expanded(
            child: Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 35,
                  squeeze: 1,
                  diameterRatio: const Helper().getDeviceheight(context),
                  selectionOverlay: Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    /* child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${quranIndex.surahs[bookIndexController.selectedSurahIndex].surahNumber == 0 ? "" : "${quranIndex.surahs[bookIndexController.selectedSurahIndex].surahNumber}. "}${quranIndex.surahs[bookIndexController.selectedSurahIndex].name}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          quranIndex
                              .surahs[bookIndexController.selectedSurahIndex]
                              .surahDetail,
                          style: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ), */
                  ),
                  scrollController: bookIndexController.surahScrollController,
                  onSelectedItemChanged: (int index) {
                    if (bookIndexController.isScrolling) return;
                    bookIndexController.selectedSurahIndex = index;
                    bookIndexController.selectedJuz =
                        quranIndex.surahs[index].juz[0];
                    bookIndexController.selectedAyah = 0;
                    bookIndexController.selectedPage =
                        quranIndex.surahs[index].ayahs[0].page! - 1;

                    bookIndexController.syncPickers(
                      selectedJuz: bookIndexController.selectedJuz,
                      selectedAyah: bookIndexController.selectedAyah,
                      selectedPage: bookIndexController.selectedPage,
                    );

                    setState(() {});
                  },
                  children: quranIndex.surahs
                      .map((surah) => Container(
                            padding: const EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${surah.surahNumber == 0 ? "" : "${surah.surahNumber}. "}${surah.name}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  surah.surahDetail,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: const Helper().getDevicewidth(context),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    color: Colors.black.withOpacity(0.7),
                    child: const Text(
                      "Surah",
                      style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //ayah column
          Container(
            width: 45,
            color: Theme.of(context).primaryColorLight,
            child: Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 35,
                  diameterRatio: const Helper().getDeviceheight(context),
                  squeeze: 1,
                  selectionOverlay: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Theme.of(context).primaryColorLight.withOpacity(0.1),
                          Theme.of(context).primaryColorLight.withOpacity(0.1),
                          Theme.of(context).primaryColorLight.withOpacity(0.1),
                          Colors.white.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    /* child: Text(
                      "${quranIndex.surahs[bookIndexController.selectedSurahIndex].ayahs[bookIndexController.selectedAyah].ayahNumber ?? ""}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColor.blackColor,
                      ),
                    ), */
                  ),
                  scrollController: bookIndexController.ayahScrollController,
                  onSelectedItemChanged: (int index) {
                    if (bookIndexController.isScrolling) return;
                    bookIndexController.selectedAyah = quranIndex
                                .surahs[bookIndexController.selectedSurahIndex]
                                .ayahs[index]
                                .ayahNumber !=
                            null
                        ? quranIndex
                                .surahs[bookIndexController.selectedSurahIndex]
                                .ayahs[index]
                                .ayahNumber! -
                            1
                        : 0;
                    bookIndexController.selectedJuz = quranIndex
                        .surahs[bookIndexController.selectedSurahIndex]
                        .ayahs[index]
                        .parah!;
                    bookIndexController.selectedPage = quranIndex
                            .surahs[bookIndexController.selectedSurahIndex]
                            .ayahs[index]
                            .page! -
                        1;

                    bookIndexController.syncPickers(
                      selectedJuz: bookIndexController.selectedJuz,
                      selectedPage: bookIndexController.selectedPage,
                    );

                    setState(() {});
                  },
                  children: quranIndex
                      .surahs[bookIndexController.selectedSurahIndex].ayahs
                      .map(
                        (ayah) => Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${ayah.ayahNumber ?? ""}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColor.blackColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    color: Colors.black.withOpacity(0.7),
                    child: const Text(
                      "Ayah",
                      style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //page column
          Container(
            width: 45,
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 35,
                  diameterRatio: const Helper().getDeviceheight(context),
                  squeeze: 1,
                  selectionOverlay: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Colors.white.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    /* child: Text(
                      "${quranIndex.pages[bookIndexController.selectedPage].pageNumber}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColor.blackColor,
                      ),
                    ), */
                  ),
                  scrollController: bookIndexController.pageScrollController,
                  onSelectedItemChanged: (int index) {
                    if (bookIndexController.isScrolling) return;
                    bookIndexController.selectedPage = index;
                    bookIndexController.selectedJuz =
                        quranIndex.pages[index].juz!;
                    bookIndexController.selectedSurahIndex = quranIndex.surahs
                        .indexWhere((surah) =>
                            surah.name == quranIndex.pages[index].surahName);
                    bookIndexController.selectedAyah =
                        quranIndex.pages[index].startAyah != null
                            ? quranIndex.pages[index].startAyah! - 1
                            : 0;

                    bookIndexController.syncPickers(
                      selectedJuz: bookIndexController.selectedJuz,
                      selectedSurah: bookIndexController.selectedSurahIndex,
                      selectedAyah: bookIndexController.selectedAyah,
                    );

                    setState(() {});
                  },
                  children: List.generate(
                    quranIndex.pages.length,
                    (index) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${quranIndex.pages[index].pageNumber}",
                        // "${index + 2}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColor.blackColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 45,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    color: Colors.black.withOpacity(0.7),
                    child: const Text(
                      "Page",
                      style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InnerShadowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(10.0),
    ));
    path.addRect(Rect.fromLTRB(2, 2, size.width - 2, size.height - 2));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
