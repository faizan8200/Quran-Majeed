import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/controllers/language_controller.dart';
import 'package:quran_app/widgets/main_body_padding.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MainBodyPadding(
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (context, index) => height15,
          itemBuilder: (context, index) {
            return Card(
              child: RadioListTile(
                title: Text(languageController.languages[index]),
                value: languageController.languages[index],
                groupValue: languageController.selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    languageController.selectedLanguage = value.toString();
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
