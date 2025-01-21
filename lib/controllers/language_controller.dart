
import 'package:get/get.dart';
import 'package:quran_app/utils/global.dart' as global;

class LanguageController extends GetxController {
//class Name
  String className = "language_controller.dart";
//controller

//model:

//list:
final List<String> languages = ['English', 'Urdu'];

//bool

//string
String selectedLanguage = 'English';

  Future<void> init() async {
    try {} catch (e) {
      global.exceptionMessage(
          classNameWithoutExt: className,
          functionNameWithoutBraces: "init",
          e: e);
    }
  }
}
