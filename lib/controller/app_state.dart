import 'package:flutter/cupertino.dart';
import 'package:github_api_v2/model/github_user.dart';

class AppState extends ChangeNotifier {
  bool isError;
  GitHubUser? _user;

  GitHubUser? get user => _user;
  AppState({this.isError = false, GitHubUser? user}){
    _user = user;
  }

  set user(GitHubUser? value) {
    if (value == _user) {
      return;
    }
    _user = value;
    notifyListeners();
  }
}