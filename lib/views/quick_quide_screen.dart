import 'package:flutter/material.dart';
import 'package:quran_app/constants/image_constant.dart';

class QuickGuideScreen extends StatefulWidget {
  const QuickGuideScreen({super.key});

  @override
  State<QuickGuideScreen> createState() => _QuickGuideScreenState();
}

class _QuickGuideScreenState extends State<QuickGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Guide"),
      ),
      body: Container(
        color: Colors.red,
        child: Image.asset(
          ImageConstant.guideImage,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
