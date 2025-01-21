import 'dart:developer';
import 'package:get/get.dart';

//SECTION - getx Controller
class DemoClassController extends GetxController {}

//SECTION - declaration
final DemoClassController demoController = Get.find<DemoClassController>();

//SECTION - Model Structure

class Model {
////!SECTION Variables
  int? id;
  String? sessionToken;
////!SECTION Constructor
  Model({this.id});
////!SECTION fromJson  Function: get Response From Backend side
  Model.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      sessionToken = json["sessionToken"];
    } catch (err) {
      log("UserModel $err");
    }
  }
////!SECTION toJson Function: send Response from App side to Backend
  Map<String, dynamic> toJson() => {
        "id": id,
        "sessionToken": sessionToken,
      };
}
