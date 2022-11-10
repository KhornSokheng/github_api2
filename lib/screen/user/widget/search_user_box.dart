import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/controller/user_controller.dart';

class SearchUserBox extends StatelessWidget {
  SearchUserBox({Key? key}) : super(key: key);

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: kIsWeb ? width*0.7 : width*0.9,
      height: 50,
      child: TextField(
          controller: userController.searchUserTextController,
          onChanged: (v) => userController.searchUser(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search',
            // hintText: 'name',
          )),
    );
  }
}
