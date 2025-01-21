import 'package:quran_app/utils/global.dart' as global;

class QuranIndex {
  final int totalJuz = 4;
  final int totalSurahs = 3;
  final int totalAyahs = 293;
  final int totalPages = 68;
  final List<Juz> juz;
  final List<Surah> surahs;
  final List<PageInfo> pages;

  QuranIndex({required this.juz, required this.surahs, required this.pages});
}

class Juz {
  final int juz;
  final List<Surah> surahs;
  final List<PageInfo> pages;

  Juz({
    required this.juz,
    required this.surahs,
    required this.pages,
  });
}

class Surah {
  final String name;
  final String surahDetail;
  final List<int> juz; // Juz numbers the Surah spans
  final int ayahCount;
  final int surahNumber;
  final int startPage;
  final int? endPage;
  final List<AyahInfo> ayahs; // Detailed Ayah info

  Surah({
    required this.name,
    required this.surahDetail,
    required this.juz,
    required this.ayahCount,
    required this.surahNumber,
    required this.startPage,
     this.endPage,
    required this.ayahs,
  });
}

class AyahInfo {
  int? ayahNumber;
  int? parah; // Juz number
  int? page;

  AyahInfo({
    required this.ayahNumber,
    required this.parah,
    required this.page,
  });

  ////!SECTION fromJson  Function: get Response From Backend side
  AyahInfo.fromJson(Map<String, dynamic> json) {
    try {
      ayahNumber = json["ayahNumber"];
      parah = json["parah"];
      page = json["page"];
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: "quran_model.dart",
          functionNameWithoutBraces: "AyahInfo.fromJson",
          e: e);
    }
  }
////!SECTION toJson Function: send Response from App side to Backend
  Map<String, dynamic> toJson() => {
        "ayahNumber": ayahNumber,
        "parah": parah,
        "page": page,
      };
}

class PageInfo {
  int? pageNumber;
  int? juz;
  String? surahName;
  int? surahNumber;
  String? imagePath;
  int? startAyah;
  int? endAyah;
  bool isBookmark = false;

  PageInfo({
    required this.pageNumber,
    required this.juz,
    required this.surahName,
    required this.surahNumber,
    required this.imagePath,
    required this.startAyah,
    required this.endAyah,
    this.isBookmark = false,
  });

  ////!SECTION fromJson  Function: get Response From Backend side
  PageInfo.fromJson(Map<String, dynamic> json) {
    try {
      pageNumber = json["pageNumber"];
      juz = json["juz"];
      surahName = json["surahName"];
      surahNumber = json["surahNumber"];
      imagePath = json["imagePath"];
      startAyah = json["startAyah"];
      endAyah = json["endAyah"];
      isBookmark = json["isBookmark"];
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: "quran_model.dart",
          functionNameWithoutBraces: "PageInfo.fromJson",
          e: e);
    }
  }
////!SECTION toJson Function: send Response from App side to Backend
  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "juz": juz,
        "surahName": surahName,
        "surahNumber": surahNumber,
        "imagePath": imagePath,
        "startAyah": startAyah,
        "endAyah": endAyah,
        "isBookmark": isBookmark,
      };
}
