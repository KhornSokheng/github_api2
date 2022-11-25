import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/view_model/repository/repository_view_model.dart';

import '../../data/api_call.dart';
import '../../model/repository/repository_model.dart';

class RepositoryListViewModel extends GetxController{
  List<RepositoryViewModel> repositoryList = [];
  List<RepositoryViewModel> tempRepositoryList = [];
  TextEditingController searchRepositoryTextController = TextEditingController();

  String selectedYear = "";
  List<String> yearList = [];


  Future<void> loadRepository(String username) async{
    List<Repository> result = await ApiCall().getRepository(username);
    repositoryList = result.map((e) => RepositoryViewModel(repository: e)).toList();
    tempRepositoryList = repositoryList;
    // setYearList();
    update();
  }
  void setSelectedYear(String newValue){
    selectedYear = newValue;
    update();
  }

  void setYearList(){

    yearList = repositoryList.map((e) => e.createdAt!.year.toString()).toList();

    // repositoryList.forEach((res) {
    //   if(res.createdAt!.year.toString() )
    //
    // });

    // print(yearList);
    //
    // print(selectedYear);
    // print( repositoryList.map((res) {
    //   print(res.createdAt!.year.toString());
    //   yearList.add( res.createdAt!.year.toString() );
    //
    //
    //
    // }).toList() );

    update();
  }


  void searchRepository() {
    String searchText = searchRepositoryTextController.text;
    searchText = searchText.removeAllWhitespace.toLowerCase();

    repositoryList = tempRepositoryList.where(
            (repository) {
          return repository.name!.toLowerCase().contains(searchText) ||
              repository.language.toLowerCase().contains(searchText)  ||
              repository.visibility!.contains(searchText)
          ;
        }

    ).toList();

    update();
  }
}