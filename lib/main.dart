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
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          fontFamily: 'Oswald',
          appBarTheme:
              const AppBarTheme(color: Colors.transparent, elevation: 0.0),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: primary)),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}
