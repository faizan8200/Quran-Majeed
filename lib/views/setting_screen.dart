import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/controllers/book_controller.dart';

// ignore: must_be_immutable
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  BookController bookController = Get.find<BookController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookController.settingList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(bookController.settingList[index].icon),
                title: Text(bookController.settingList[index].title ?? ""),
                trailing: bookController.settingList[index].id ==
                        2 // 2 id is for screen On
                    ? Container(
                        constraints: const BoxConstraints.tightFor(
                          width: 35, // Adjust width based on scaled size
                          height: 30, // Adjust height based on scaled size
                        ),
                        child: Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            activeColor: Theme.of(context).primaryColor,
                            thumbColor: WidgetStatePropertyAll(
                                bookController.isScreenOn
                                    ? AppColor.whiteColor
                                    : AppColor.greyColor),
                            trackOutlineColor: WidgetStatePropertyAll(
                                bookController.isScreenOn
                                    ? Theme.of(context).primaryColor
                                    : AppColor.greyColor),
                            trackColor: WidgetStatePropertyAll(
                                bookController.isScreenOn
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent),
                            thumbIcon: bookController.thumbIcon,
                            value: bookController.isScreenOn,
                            onChanged: (bool value) async {
                              await bookController.toggleWakelock(value);
                              bookController.update();
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    : const Icon(Icons.chevron_right_rounded),
                onTap: () => bookController.onTapOfSetting(index),
              );
            },
          ),
        ),
        //we have to give this height beacuse modalBottomsheet take height from above of 60 so beacuse of that it s cut the UI
        const SizedBox(height: 70)
      ],
    );
  }
}
