// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionProvider extends ChangeNotifier {
  bool _hasInternet = true;
  bool get hasInternet => _hasInternet;

  final connectionChecker = InternetConnectionChecker.instance;

  InternetConnectionProvider() {
    startInternetListener();
  }

  void startInternetListener() {
    connectionChecker.onStatusChange.listen((InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        _hasInternet = true;
        notifyListeners();
      } else {
        _hasInternet = false;
        notifyListeners();
      }
    });
  }
}
