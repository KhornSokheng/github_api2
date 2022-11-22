import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/user/user_list_view_model.dart';

class SearchUserBox extends StatelessWidget {
  SearchUserBox({Key? key}) : super(key: key);

  final UserListViewModel userListViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width >800 ? width*0.7 : width*0.9,
      height: 50,
      child: TextField(
          controller: userListViewModel.searchUserTextController,
          onChanged: (v) => userListViewModel.searchUser(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search',
            // hintText: 'name',
          )),
    );
  }
}
