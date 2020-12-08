import 'package:flutter/foundation.dart';
import 'package:init_project/models/userModel.dart';

class UserProvider with ChangeNotifier {
  String _id;
  String _fullName;
  String _phone;
  String _email;

  String get userId => _id;
  String get fullName => _fullName;
  String get phone => _phone;
  String get email => _email;

  saveProfile(UserModel user) async {
    _id = user.userId;
    _fullName = user.name;
    _phone = user.phone;
    _email = user.email;
  }
}
