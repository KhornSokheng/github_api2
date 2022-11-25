import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/screen/user/widget/search_user_box.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item2.dart';
import 'package:github_api_v2/view_model/user/user_view_model.dart';

import '../../controller/user_controller.dart';
import '../../model/user/github_user.dart';
import '../../view_model/user/user_list_view_model.dart';
import '../util/utility.dart';

class UserScreen extends StatefulWidget {
  final Function(UserViewModel)? onUserSelected;

  UserScreen({Key? key, this.onUserSelected}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final userListViewModel = Get.put(UserListViewModel());

  @override
  void initState() {
    super.initState();
    userListViewModel.loadUser();
  }
  @override
  Widget build(BuildContext context) {
    // userListViewModel.loadUser();

    return Scaffold(
        appBar: AppBar(
          title: Text("Git Hub User"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: SearchUserBox(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<UserListViewModel>(
                builder: (_) {
                  return userListViewModel.tempUserList.isEmpty
                      ? showProgressIndicator()
                      : userListViewModel.userList.isEmpty
                          ? showEmptySearchResult()
                          : buildUserCardGrid(userListViewModel.userList);
                },
              ),
            ),
          ],
        ));
  }

  Widget buildUserCardGrid(List<UserViewModel> userList ) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = (width < 800) ? 1 : 2;

    return SingleChildScrollView(
      child: SizedBox(
        width: width > 800 ? width * 0.7 : width * 0.9,
        height: 1000,
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 32 / 9,
          padding: const EdgeInsets.only(bottom: 150.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: userList
              .map((user) => InkWell(
                  onTap: () {
                    widget.onUserSelected?.call(user);
                  },
                  child: UserCardItem2(user: user)))
              .toList(),
        ),
      ),
    );
  }
}
