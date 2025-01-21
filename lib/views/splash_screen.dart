import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/helper.dart';
import 'package:quran_app/constants/image_constant.dart';
import 'package:quran_app/controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    splashController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: const Helper().getDeviceheight(context),
        width: const Helper().getDevicewidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageConstant.splashImage),
          ),
        ),
      ),
    );
  }
}
