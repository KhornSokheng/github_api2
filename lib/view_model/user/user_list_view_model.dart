import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/model/user/github_user.dart';
import 'package:github_api_v2/view_model/user/user_view_model.dart';

import '../../data/api_call.dart';

class UserListViewModel extends GetxController{

  List<UserViewModel> tempUserList =[];
  List<UserViewModel> userList =[];
  TextEditingController searchUserTextController = TextEditingController();


  Future<void> loadUser() async{
    List<GitHubUser> result = await ApiCall().getUser();
    userList = result.map((e) => UserViewModel(user: e)).toList();
    tempUserList = userList;
    update();
  }

  void searchUser() {
    String searchText = searchUserTextController.text;

    userList = tempUserList.where((user) => user.login.contains(searchText.removeAllWhitespace.toLowerCase())).toList();

    update();
  }

  UserViewModel? getUserByUsername(String username){

    List<UserViewModel> list = tempUserList.where((element) => element.login == username).toList();
    if(list.isNotEmpty){
      return list.first;
    }else{
      return null;
    }
  }


}