import 'package:flutter/material.dart';
import 'package:provider_base/screens/user_screen/user_variables.dart';

import '../../models/user_model.dart';
class UserProvider with ChangeNotifier, UserVariables {
  User _user = User(name: 'Guest', age: 0);

  User get user => _user;

  void updateUser(String name, int age) {
    _user = User(name: name, age: age);
    notifyListeners();
  }
}
