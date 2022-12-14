import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/view_model/repository/repository_list_view_model.dart';

class SearchRepositoryBox extends StatelessWidget {
  SearchRepositoryBox({Key? key}) : super(key: key);

  final RepositoryListViewModel repositoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: kIsWeb ? width*0.7 : width*0.9,
      height: 50,
      child: TextField(
          autofocus: true,
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
