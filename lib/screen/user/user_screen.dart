import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/screen/user/widget/search_user_box.dart';

import '../../controller/user_controller.dart';
import '../../model/github_user.dart';
import 'widget/user_card_item.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.loadUser();

    return Scaffold(
        appBar: AppBar(
          title: Text("Git Hub User"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Center(
                child: SearchUserBox(),

              ),
              SizedBox(height: 10,),
              GetBuilder<UserController>(
                builder: (_) => buildUserCards(userController.userList),
              ),
            ],
          ),
        ));
  }
}

Widget buildUserCards(List<GitHubUser> userList) {
  return Column(
    children: userList.map((user) => UserCardItem(user: user)).toList(),
  );
}
