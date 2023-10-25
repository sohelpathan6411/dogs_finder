import 'package:dogs_finder/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

import '../modules/splash/bindings/splash_binding.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
