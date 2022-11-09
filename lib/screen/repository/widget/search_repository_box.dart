import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/controller/repository_controller.dart';
import 'package:github_api_v2/controller/user_controller.dart';

class SearchRepositoryBox extends StatelessWidget {
  SearchRepositoryBox({Key? key}) : super(key: key);

  final RepositoryController repositoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 50,
      child: TextField(
          controller: repositoryController.searchRepositoryTextController,
          onChanged: (v) => repositoryController.searchRepository(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search',
            // hintText: 'name',
          )),
    );
  }
}
