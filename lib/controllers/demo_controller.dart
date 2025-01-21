import 'dart:developer';

import 'package:quran_app/constants/message_constant.dart';
import 'package:quran_app/models/demo_api_model.dart';
import 'package:quran_app/services/api_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quran_app/utils/global.dart' as global;

class DemoController extends GetxController {
//controller
  ScrollController scrollController = ScrollController();

//model:
  APIHelper apiHelper = APIHelper();

//list:
  List<DemoApiModel> demoApiList = [];

//bool
  RxBool isAppWorking = false.obs;

  @override
  void onInit() {
    super.onInit();
    log("Home Init");
    init();
  }

  Future<void> init() async {
////!SECTION Check Introscreen is first time or not
////!SECTION  notification Permission
////!SECTION  navigation process
  }
  bool themeChanges() {
    try {
      global.themeController.isDarkTheme = !global.themeController.isDarkTheme;
      global.themeController.update();
      return global.themeController.isDarkTheme;
    } catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: "demo_controller",
          functionNameWithoutBraces: "themeChanges",
          e: e);
      return false;
    }
  }

  Future<List<DemoApiModel>> demoApi() async {
    try {
      await apiHelper.demoApi().then((result) {
        if (result.status == "200") {
          demoApiList = result.recordList;
          log(demoApiList.length.toString());
        } else {
          global.showSnackBar(
            MessageConstant.warning,
            result.message,
          );
        }
      });
      return demoApiList;
    } catch (e) {
      global.hideLoader();
      global.exceptionMessage(
          classNameWithoutExt: "demo_controller",
          functionNameWithoutBraces: "dempApi",
          e: e);
      return [];
    }
  }
}


/* 

import 'package:get/get.dart';
import 'package:quran_app/utils/global.dart' as global;

class IntroductionController extends GetxController {
//class Name
  String className = "introduction_controller.dart";
//controller

//model:

//list:

//bool

  Future<void> init() async {
    try {} catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }
}

 */