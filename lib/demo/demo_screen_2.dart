import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/widgets/common_elevated_button.dart';
import 'package:quran_app/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/utils/global.dart' as global;

class DemoScreen2 extends StatelessWidget {
  const DemoScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: TabBar(
              indicatorPadding: EdgeInsets.all(0), //default
              indicatorWeight: 2, //default
              tabs: [
                Tab(text: "1"),
                Tab(text: "2"),
              ],
            ),
          ),
          height20,
          const Divider(),
          height20,
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: AppColor.primaryLightColor,
            child: const Card(),
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
                onPressed: () {
                  global.commonDialog(context,
                      titleText: 'Delete Notifications',
                      contentText:
                          'Are you sure do you want to remove all notifications?',
                      leftActionButtonText: 'No',
                      rightActionButtonText: 'Yes',
                      leftActionButtonOnPressed: () {
                    Get.back();
                  }, rightActionButtonOnPressed: () async {
                    Get.back();
                  });
                },
                child: const Text("Dialog")),
          ),
          height20,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: AppTextFormField(),
          ),
          height20,
          CommonElevatedButton(onPressed: () {}, buttonText: "Card"),
        ],
      ),
    );
  }
}
