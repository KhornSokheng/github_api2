import 'package:flutter/cupertino.dart';
import 'package:github_api_v2/model/github_user.dart';
import 'package:github_api_v2/view_model/user/user_view_model.dart';

class AppState extends ChangeNotifier {
  bool isError;
  UserViewModel? _user;

  UserViewModel? get user => _user;
  AppState({this.isError = false, UserViewModel? user}){
    _user = user;
  }

  set user(UserViewModel? value) {
    if (value == _user) {
      return;
    }
    _user = value;
    notifyListeners();
  }
}