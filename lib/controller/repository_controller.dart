import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/api_call.dart';
import '../model/repository_model.dart';

class RepositoryController extends GetxController {

  List<Repository> repositoryList = [];
  List<Repository> tempRepositoryList = [];
  TextEditingController searchRepositoryTextController = TextEditingController();

  String selectedYear = "";
  List<String> yearList = [];

  Future<void> loadRepository(String username) async{
    repositoryList = await ApiCall().getRepository(username);
    tempRepositoryList = repositoryList;
    setYearList();
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