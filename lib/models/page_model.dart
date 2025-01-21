import 'package:quran_app/utils/global.dart' as global;

class PageModel {
////!SECTION Variables
  int? pageNumber;
  String? imagePath;
  bool isBookmark = false;
////!SECTION Constructor
  PageModel({
    this.pageNumber,
    this.imagePath,
    this.isBookmark = false,
  });
////!SECTION fromJson  Function: get Response From Backend side
  PageModel.fromJson(Map<String, dynamic> json) {
    try {
      pageNumber = json["pageNumber"];
      imagePath = json["imagePath"];
      isBookmark = json["isBookmark"];
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: "PageModel.dart",
          functionNameWithoutBraces: "PageModel.fromJson",
          e: e);
    }
  }
////!SECTION toJson Function: send Response from App side to Backend
  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "imagePath": imagePath,
        "isBookmark": isBookmark,
      };
}
