import 'dart:developer';
import 'dart:io';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//!----------------------------------------------------------------------Variables----------------------------------------------------------------------------------
///* int */

///* string */
String websiteUrl = "https://www.nooranimakatib.com/";

///* Controller */
ThemeAndLanguageController themeController =
    Get.find<ThemeAndLanguageController>();

///* Local Storage */
SharedPreferences? sp;

////* Api Parameter */
String imageBaseUrl = "http://indiarides.voidek.in/public/assets//users_imgs/";
String appMode = "LIVE";
Map<String, dynamic> appParameters = {
  "LIVE": {
    "apiUrl": "http://indiarides.voidek.in/api/",
    "imageBaseurl": "http://indiarides.voidek.in/public/assets//users_imgs/",
  },
  "DEV": {
    "apiUrl": "http://192.168.29.123:1401/",
  }
};
String appId = "shared_ride_app";

///* Others */
Map<int, Color> lightColor = {
  50: const Color.fromRGBO(117, 147, 203, .1),
  100: const Color.fromRGBO(117, 147, 203, .2),
  200: const Color.fromRGBO(117, 147, 203, .3),
  300: const Color.fromRGBO(117, 147, 203, .4),
  400: const Color.fromRGBO(117, 147, 203, .5),
  500: const Color.fromRGBO(117, 147, 203, .6),
  600: const Color.fromRGBO(117, 147, 203, .7),
  700: const Color.fromRGBO(117, 147, 203, .8),
  800: const Color.fromRGBO(117, 147, 203, .9),
  900: const Color.fromRGBO(117, 147, 203, 1),
};
Map<int, Color> darkColor = {
  50: const Color.fromRGBO( 52, 66, 121, .1),
  100: const Color.fromRGBO(52, 66, 121, .2),
  200: const Color.fromRGBO(52, 66, 121, .3),
  300: const Color.fromRGBO(52, 66, 121, .4),
  400: const Color.fromRGBO(52, 66, 121, .5),
  500: const Color.fromRGBO(52, 66, 121, .6),
  600: const Color.fromRGBO(52, 66, 121, .7),
  700: const Color.fromRGBO(52, 66, 121, .8),
  800: const Color.fromRGBO(52, 66, 121, .9),
  900: const Color.fromRGBO(52, 66, 121, 1),
};

Transition navigationAnimation = Transition.rightToLeft;
Duration navigationDuration = const Duration(milliseconds: 800);
//!----------------------------------------------------------------------Functions--------------------------------------------------------------------------------------
///* Loaders */
showOnlyLoaderDialog() {
  try {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "showOnlyLoaderDialog",
        e: e);
  }
}

////* hideLoader */
void hideLoader() {
  try {
    Get.back();
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "hideLoader",
        e: e);
  }
}

///* Dialogs */
showExitDialog(BuildContext context) async {
  try {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Exit"),
          content: const Text("Are you sure, you want to exit App?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => exit(0),
              child: const Text("Exit"),
            )
          ],
        );
      },
    );
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "showExitDialog",
        e: e);
  }
}

////* commonDialog */
commonDialog(
  BuildContext context, {
  @required String? titleText,
  @required String? contentText,
  @required String? leftActionButtonText,
  @required String? rightActionButtonText,
  @required void Function()? leftActionButtonOnPressed,
  @required void Function()? rightActionButtonOnPressed,
}) async {
  try {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText ?? "-"),
          content: Text(contentText ?? "-"),
          actions: <Widget>[
            TextButton(
              onPressed: leftActionButtonOnPressed,
              child: Text(leftActionButtonText ?? "-"),
            ),
            TextButton(
              onPressed: rightActionButtonOnPressed,
              child: Text(rightActionButtonText ?? "-"),
            )
          ],
        );
      },
    );
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "commonDialog",
        e: e);
  }
}

////* Snackbar */
showSnackBar(String title, String text) {
  return Get.snackbar(
    title,
    text,
    dismissDirection: DismissDirection.horizontal,
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: AppColor.blackColor,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  );
}

////* Exception Message OR Log OR Print */
void exceptionMessage(
    {@required String? classNameWithoutExt,
    @required String? functionNameWithoutBraces,
    @required Object? e}) {
  try {
    log("Exception: $classNameWithoutExt.dart: $functionNameWithoutBraces(): $e",
        time: DateTime.now());
  } catch (e) {
    log("Exception: global.dart: exceptionMessage(): $e");
  }
}

////* navigation screen to */
navigateTo(Widget redirectScreenName) {
  try {
    Get.to(
      () => redirectScreenName,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 800),
    );
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "navigateTo",
        e: e);
  }
}

////* launch any web */
website(String url) async {
  try {
    if (!await launchUrl(
      Uri.parse(url),
      mode: Platform.isIOS
          ? LaunchMode.platformDefault
          : LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    exceptionMessage(
        classNameWithoutExt: "global",
        functionNameWithoutBraces: "website",
        e: e);
    return null;
  }
}
