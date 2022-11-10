import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_api_v2/screen/repository/widget/search_repository_box.dart';
import 'package:github_api_v2/screen/repository/widget/year_dropdown_button.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item2.dart';

import '../../controller/repository_controller.dart';
import '../../controller/user_controller.dart';
import '../../model/github_user.dart';
import '../../model/repository_model.dart';
import 'widget/repository_card.dart';

class RepositoryScreen extends StatelessWidget {
  GitHubUser user;

  RepositoryScreen({required this.user});

  final repositoryController = Get.put(RepositoryController());


  @override
  Widget build(BuildContext context) {

    repositoryController.loadRepository(user.login!);

    return Scaffold(
      appBar: AppBar(
        title: Text("Repository of ${user.login}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              UserCardItem(user: user),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchRepositoryBox(),
                  // SizedBox(width: 10,),
                  // YearDropdownButton(),
                ],
              ),
              GetBuilder<RepositoryController>(
                builder: (_) => buildRepositoryGrid(repositoryList: repositoryController.repositoryList)
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRepositoryGrid( {required List<Repository> repositoryList}) {

  double width = Get.mediaQuery.size.width;
  int crossAxisCount = (width<500) ? 1 : (width<800) ? 2 : 4;

  return Container(
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
  );
}