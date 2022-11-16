import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/controller/user_controller.dart';
import 'package:github_api_v2/screen/repository/widget/search_repository_box.dart';
import 'package:github_api_v2/screen/repository/widget/user_card_web.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item.dart';
import 'package:github_api_v2/screen/util/not_found_page.dart';

import '../../controller/repository_controller.dart';
import '../../model/github_user.dart';
import '../../model/repository_model.dart';
import '../util/utility.dart';
import 'widget/repository_card.dart';

class RepositoryScreen extends StatelessWidget {
  late GitHubUser user;
  String username;

  RepositoryScreen({required this.username});

  final repositoryController = Get.put(RepositoryController());
  UserController userController = Get.find();


  @override
  Widget build(BuildContext context) {

    user = userController.getUserByUsername(username);
    if(user.login == null) return NotFoundPage();
    repositoryController.loadRepository(user.login!);

    return Scaffold(
      appBar: AppBar(
        title: Text("Repository of ${user.login}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            kIsWeb ? UserCardWeb(user: user) : UserCardItem(user: user),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchRepositoryBox(),
                // SizedBox(width: 10,),
                // YearDropdownButton(),
              ],
            ),
            Expanded(
              child: GetBuilder<RepositoryController>(
                builder: (_) =>
                    repositoryController.tempRepositoryList.isEmpty ? showProgressIndicator() :
                    repositoryController.repositoryList.isEmpty ? showEmptySearchResult() :
                    buildRepositoryGrid(repositoryList: repositoryController.repositoryList)
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildRepositoryGrid( {required List<Repository> repositoryList}) {

  double width = Get.mediaQuery.size.width;
  int crossAxisCount = (width<500) ? 1 : (width<800) ? 2 : 4;

  return SingleChildScrollView(
    child: SizedBox(
      width: kIsWeb ? width*0.7 : width*0.9,
      height: 900,
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 4/3,
        padding: const EdgeInsets.symmetric (vertical: 10.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children:
        repositoryList.map((repository) => RepositoryCard(repository: repository,)).toList(),

      ),
    ),
  );
}