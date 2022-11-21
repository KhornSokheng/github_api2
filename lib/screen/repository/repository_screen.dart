import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/screen/repository/widget/search_repository_box.dart';
import 'package:github_api_v2/screen/repository/widget/user_card_web.dart';
import 'package:github_api_v2/screen/user/widget/user_card_item.dart';

import '../../controller/repository_controller.dart';
import '../../model/github_user.dart';
import '../../model/repository_model.dart';
import '../util/utility.dart';
import 'widget/repository_card.dart';

class RepositoryScreen extends StatefulWidget {
  late GitHubUser user;

  RepositoryScreen({required this.user});

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  final repositoryController = Get.put(RepositoryController());

  Future<void> loadRepos() async {
    await repositoryController.loadRepository(widget.user.login!);
  }

  @override
  initState(){
    print("init called");
    loadRepos();


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Repository of ${widget.user.login}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            kIsWeb ? UserCardWeb(user: widget.user) : UserCardItem(user: widget.user),
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
                init: Get.put(RepositoryController()),
                builder: (controller) {

                  return
                    controller.tempRepositoryList.isEmpty ? showProgressIndicator() :
                    controller.repositoryList.isEmpty
                      ? showEmptySearchResult()
                      : buildRepositoryGrid(repositoryList: controller.repositoryList);

                }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRepositoryGrid({List<Repository>? repositoryList}) {

    double width = context.width;
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
          children:repositoryList!.map((repository) => RepositoryCard(repository: repository)).toList(),

        ),
      ),
    );
  }

}