import 'package:flutter/material.dart';
import 'package:quran_app/utils/global.dart' as global;

class SettingModel {
////!SECTION Variables
  int? id;
  IconData? icon;
  String? title;
////!SECTION Constructor
  SettingModel({
    this.id,
    this.icon,
    this.title,
  });
////!SECTION fromJson  Function: get Response From Backend side
  SettingModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      icon = json["icon"];
      title = json["title"];
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: "SettingModel.dart",
          functionNameWithoutBraces: "SettingModel.fromJson",
          e: e);
    }
  }
}
