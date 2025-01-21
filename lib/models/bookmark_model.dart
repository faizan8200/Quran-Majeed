  import 'package:quran_app/models/quran_model.dart';
import 'package:quran_app/utils/global.dart' as global;

  class BookMarkModel {
  ////!SECTION Variables
    List<PageInfo>? bookmarkPageList = [];
  ////!SECTION Constructor
    BookMarkModel({
      this.bookmarkPageList,
    });
  ////!SECTION fromJson  Function: get Response From Backend side
    BookMarkModel.fromJson(Map<String, dynamic> json) {
      try {
         bookmarkPageList =json["bookmarkPageList"] != null ? List<PageInfo>.from(json["bookmarkPageList"]) : [];
      } catch (e) {
        global.exceptionMessage(
            classNameWithoutExt: "bookmark_model.dart",
            functionNameWithoutBraces: "BookMarkModel.fromJson",
            e: e);
      }
    }
  ////!SECTION toJson Function: send Response from App side to Backend
    Map<String, dynamic> toJson() => {
          "bookmarkPageList": bookmarkPageList,
        };
  }
