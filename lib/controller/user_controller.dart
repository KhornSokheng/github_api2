
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/data/api_call.dart';

import '../model/github_user.dart';

class UserController extends GetxController {
  List<GitHubUser> tempUserList =[];
  List<GitHubUser> userList =[];
  TextEditingController searchUserTextController = TextEditingController();

  Future<void> loadUser() async{
    userList = await ApiCall().getUser();
    tempUserList = userList;
    update();
  }

  void searchUser() {
    String searchText = searchUserTextController.text;

    userList = tempUserList.where((user) => user.login!.contains(searchText.removeAllWhitespace.toLowerCase())).toList();

    update();
  }


}