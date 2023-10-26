import 'package:dogs_finder/app/modules/splash/bindings/splash_binding.dart';
import 'package:dogs_finder/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/utils.dart';

import 'app/routes/app_pages.dart';
import 'core/consts/color_consts.dart';
import 'localisation/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'dogs_finder'.tr,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            secondary: secondary,
            primary: primary,
          ),
          fontFamily: 'Oswald',
          appBarTheme: const AppBarTheme(
              backgroundColor: bgColor,
              titleTextStyle: TextStyles.kTSNFS16W600,
              elevation: 0.0),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: primary)),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    );
  }
}
