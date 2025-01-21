import 'package:quran_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/utils/global.dart' as global;

ThemeData nativeTheme() {
  if (global.themeController.isDarkTheme == false) {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
      // fontFamily: 'Gilroy',
      primaryColor: AppColor.primaryColor,
      primaryColorLight: AppColor.primaryLightColor,
      primarySwatch: MaterialColor(0xffFFFFFF, global.lightColor),
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      primaryIconTheme: const IconThemeData(color: AppColor.primaryColor),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(0xffFFFFFF, global.lightColor),
      ),
      radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.whiteColor,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.greyColor,
        selectedIconTheme: IconThemeData(size: 30),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(size: 30),
      ),
      appBarTheme: const AppBarTheme(
        color: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
        actionsIconTheme: IconThemeData(color: AppColor.whiteColor),
        iconTheme: IconThemeData(color: AppColor.whiteColor, size: 20),
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: AppColor.blackColor,
        dividerHeight: 1,
        indicator: BoxDecoration(color: AppColor.primaryColor),
        indicatorColor: AppColor.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColor.whiteColor, //active
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        unselectedLabelColor: AppColor.blackColor,
        unselectedLabelStyle: TextStyle(fontSize: 20),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1.3,
        color: AppColor.sheetBackgroundColor,
        space: 0,
      ),
      switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(AppColor.greyColor),
        trackColor: WidgetStatePropertyAll(AppColor.primaryColor),
        trackOutlineColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
      cardTheme: CardTheme(
        color: AppColor.whiteColor,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: const TextStyle(
            color: AppColor.primaryButtonColor,
            fontSize: 24,
            fontWeight: FontWeight.w500),
        contentTextStyle: const TextStyle(
            color: AppColor.primaryButtonColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        iconColor: AppColor.primaryColor,
      ),
//bodyMedium is an default Textstyle
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: AppColor.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: AppColor.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w700),
        displaySmall: TextStyle(
            color: AppColor.primaryButtonColor,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: AppColor.blackColor),
        headlineSmall: TextStyle(
            color: AppColor.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w300), //text field title
        titleLarge: TextStyle(
            color: AppColor.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            color: AppColor.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(
            color: AppColor.bodyTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w300),
        bodyMedium: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(color: AppColor.blackColor, fontSize: 11),
      ),
      primaryTextTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColor.blackColor),
        displayMedium: TextStyle(color: AppColor.blackColor),
        displaySmall: TextStyle(color: AppColor.blackColor),
        headlineMedium: TextStyle(color: AppColor.blackColor),
        headlineSmall: TextStyle(color: AppColor.blackColor),
        titleLarge: TextStyle(color: AppColor.blackColor),
        titleMedium: TextStyle(color: AppColor.blackColor),
        titleSmall: TextStyle(color: AppColor.blackColor),
        bodyLarge: TextStyle(color: AppColor.blackColor),
        bodyMedium: TextStyle(color: AppColor.blackColor),
        bodySmall: TextStyle(color: AppColor.blackColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColor.blackColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColor.blackColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.blackColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderSideColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        hintStyle: TextStyle(color: AppColor.hintColor, fontSize: 14),
        labelStyle: TextStyle(color: AppColor.hintColor, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize:
              WidgetStateProperty.all(const Size(double.infinity, 45)), //height
          minimumSize:
              WidgetStateProperty.all(const Size(double.infinity, 45)), //width
          elevation: WidgetStateProperty.all(1),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          padding: WidgetStateProperty.all(
              const EdgeInsets.only(left: 15, right: 15)),
          backgroundColor: WidgetStateProperty.all(AppColor.primaryColor),
          foregroundColor: WidgetStateProperty.all(AppColor.whiteColor),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 18)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColor.primaryColor),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
                color: AppColor.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  } else {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.greyColor,
        // fontFamily: 'Gilroy',
        primaryColor: AppColor.blackColor,
        primaryColorLight: AppColor.greyColor,
        primarySwatch: MaterialColor(0xff000000, global.darkColor),
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        primaryIconTheme: const IconThemeData(color: AppColor.whiteColor),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(0xff000000, global.darkColor),
        ),
        appBarTheme: const AppBarTheme(
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
          color: AppColor.blackColor,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor),
          actionsIconTheme: IconThemeData(color: AppColor.whiteColor),
          iconTheme: IconThemeData(color: AppColor.whiteColor, size: 20),
        ),
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(AppColor.primaryColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.whiteColor,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.greyColor,
          selectedIconTheme: IconThemeData(size: 30),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(size: 30),
        ),
        switchTheme: const SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(AppColor.greyColor),
          trackColor: WidgetStatePropertyAll(AppColor.primaryColor),
          trackOutlineColor: WidgetStatePropertyAll(AppColor.primaryColor),
        ),
        tabBarTheme: const TabBarTheme(
          dividerColor: AppColor.blackColor,
          dividerHeight: 1,
          indicator: BoxDecoration(color: AppColor.tabBarBackgroundColor),
          indicatorColor: AppColor.primaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColor.whiteColor, //active
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          unselectedLabelColor: AppColor.blackColor,
          unselectedLabelStyle: TextStyle(fontSize: 20),
        ),
        dividerTheme: const DividerThemeData(
            thickness: 1.1, color: AppColor.borderSideColor),
        cardTheme: CardTheme(
          color: AppColor.cardBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColor.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          titleTextStyle: const TextStyle(
              color: AppColor.primaryButtonColor,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          contentTextStyle: const TextStyle(
              color: AppColor.primaryButtonColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          iconColor: AppColor.primaryColor,
        ),
//default Text Style is TextStyle(fontSize: 12,fontWeight: FontWeight: w400,color:Colors.black)
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w700),
          displaySmall: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(color: AppColor.whiteColor),
          headlineSmall: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w300), //text field title
          titleLarge: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w400),
          titleMedium: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 15,
              fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
          bodySmall: TextStyle(color: AppColor.whiteColor, fontSize: 11),
        ),
        primaryTextTheme: const TextTheme(
          displayLarge: TextStyle(color: AppColor.whiteColor),
          displayMedium: TextStyle(color: AppColor.whiteColor),
          displaySmall: TextStyle(color: AppColor.whiteColor),
          headlineMedium: TextStyle(color: AppColor.whiteColor),
          headlineSmall: TextStyle(color: AppColor.whiteColor),
          titleLarge: TextStyle(color: AppColor.whiteColor),
          titleMedium: TextStyle(color: AppColor.whiteColor),
          bodyLarge: TextStyle(color: AppColor.whiteColor),
          titleSmall: TextStyle(color: AppColor.whiteColor),
          bodyMedium: TextStyle(color: AppColor.whiteColor),
          bodySmall: TextStyle(color: AppColor.whiteColor),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColor.whiteColor,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: AppColor.borderSideColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: AppColor.borderSideColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.borderSideColor, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.borderSideColor, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintStyle: TextStyle(
              color: AppColor.hintColor,
              fontWeight: FontWeight.w200,
              fontSize: 14),
          labelStyle: TextStyle(
              color: AppColor.hintColor,
              fontWeight: FontWeight.w200,
              fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
                const Size(double.infinity, 45)), //height
            minimumSize: WidgetStateProperty.all(
                const Size(double.infinity, 45)), //width
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            padding: WidgetStateProperty.all(
                const EdgeInsets.only(left: 15, right: 15)),
            backgroundColor: WidgetStateProperty.all(AppColor.whiteColor),
            foregroundColor: WidgetStateProperty.all(AppColor.blackColor),
            textStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(AppColor.whiteColor),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
