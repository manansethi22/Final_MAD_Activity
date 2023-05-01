import 'package:flutter/material.dart';

class PasswordModel extends ChangeNotifier {
  String password = '';

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}