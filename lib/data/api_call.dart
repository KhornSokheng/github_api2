
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../model/repository_model.dart';
import '../model/github_user.dart';



class ApiCall {

  Future<List<GitHubUser>> getUser() async{
    var url = Uri.https('api.github.com', 'users');

    var response = await http.get(url);

    if(response.statusCode == 200){
      List<GitHubUser> gitHubUser = gitHubUserFromJson(response.body);
      return gitHubUser;
    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }

  }

  Future<List<Repository>> getRepository(String username) async{
    var url = Uri.https('api.github.com', 'users/$username/repos');
    var response = await http.get(url);
    if(response.statusCode == 200){
      final repositories = repositoryFromJson(response.body);
      return repositories;

    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }
  }

  Future<int> getNumRepository(String username) async{
    var url = Uri.https('api.github.com', 'users/$username/repos');
    var response = await http.get(url);
    if(response.statusCode == 200){
      print(json.decode(response.body).length);
      return json.decode(response.body).length;

    }else {
      print('Request failed with status: ${response.statusCode}.');
      return 0;
    }
  }

  Future<void> goToUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if(! await launchUrl(url)){
      throw 'Could not launch $url';
    }
  }

}