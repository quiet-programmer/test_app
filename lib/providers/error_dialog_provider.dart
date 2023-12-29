import 'package:flutter/material.dart';

class ErrorDialogProvider with ChangeNotifier {
  String? errorText;

  void errorCheckDialog(String error) {
    errorText = error;
    notifyListeners();
  }
}