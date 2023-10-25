import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/widget_utils/custom_snack_bars.dart';

mixin NetworkCheckService {
  Future<bool> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      CustomSnackbars().showErrorSnack(
          title: 'no_internet'.tr, message: 'connect_wifi_data'.tr);
    }
    return result;
  }
}
