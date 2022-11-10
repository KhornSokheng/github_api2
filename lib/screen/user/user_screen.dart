import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/screen/user/widget/search_user_box.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item2.dart';

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
          centerTitle: true,
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
                builder: (_) => buildUserCardGrid(userController.userList, context),
              ),
            ],
          ),
        ));
  }
}

Widget buildUserCardGrid(List<GitHubUser> userList, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  print(width);
  int crossAxisCount = (width<500) ? 1 : (width<800) ? 1 : 2;
  print(width/crossAxisCount);

  return SizedBox(
    width: width>800 ? width*0.7 : width*0.9,
    height: 3000,
    child: GridView.count(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 32/9,
      padding: const EdgeInsets.only(bottom: 150.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: userList.map((user) => UserCardItem2(user: user)).toList(),
    ),
  );
}
