import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.SPLASH, page: () => const SizedBox() //const SplashView(),
        ),
  ];
}
