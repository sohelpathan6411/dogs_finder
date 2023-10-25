// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const DASHBOARD = '/dashboard';
}
