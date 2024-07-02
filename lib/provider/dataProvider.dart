import 'package:flutter/material.dart';

class AuthDataProvider extends ChangeNotifier {
 String _userID= "NotSighin";

  String get userID => _userID;

  void getUserId(String userid) {
    _userID = userid;
    notifyListeners();
  }
}
