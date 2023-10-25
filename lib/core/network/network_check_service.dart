import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

mixin NetworkCheckService {
  Future<bool> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
}
