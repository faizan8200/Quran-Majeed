import 'package:flutter/services.dart';
import 'package:quran_app/controllers/theme_controller.dart';
import 'package:quran_app/theme/native_theme.dart';
import 'package:quran_app/utils/binding/controller_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/utils/global.dart' as global;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  global.sp = await SharedPreferences.getInstance();
  Get.put(ThemeAndLanguageController());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeAndLanguageController>(builder: (themeController) {
      return GetMaterialApp(
        title: 'Quran Majeed',
        navigatorKey: Get.key,
        enableLog: true,
        initialBinding: ControllerBinding(),
        theme: nativeTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: "SplashScreen",
        home: const SplashScreen(),
      );
    });
  }
}
