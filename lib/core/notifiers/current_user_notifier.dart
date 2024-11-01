import 'package:flutter/material.dart';
import 'package:novindus_task/features/auth/models/user_model.dart';

class CurrentUserNotifier extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? get user => _userModel;

  void addUser(UserModel usermodel) {
    _userModel = usermodel;
    notifyListeners();
  }
}
