import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_api_v2/route/route.dart';
import 'package:github_api_v2/view_model/user/user_list_view_model.dart';

import '../controller/user_controller.dart';
import '../model/user/github_user.dart';
import '../view_model/user/user_view_model.dart';
import 'configuration.dart';

class MyRouteInformationParser extends RouteInformationParser<Configuration> {
  @override
  Future<Configuration> parseRouteInformation(
      RouteInformation routeInformation) async {

    var uri = Uri.parse(routeInformation.location!);

    if(uri.pathSegments.isEmpty){
      return Configuration.user();
    }else if(uri.pathSegments.length == 2 && uri.pathSegments[0] == "repository"){
      String username = uri.pathSegments[1];
      // UserController userController = Get.find();
      UserListViewModel userListViewModel = Get.put(UserListViewModel());
      UserViewModel? user = userListViewModel.getUserByUsername(username);
      if(user != null){
        return Configuration(
          route: Routes.REPOSITORY, arguments: {"user": user}
        );
      }

    }

    return Configuration.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(Configuration configuration) {
    if (configuration.isKnown) {
      if (configuration.route == Routes.USER) {
        return const RouteInformation(location: "/");
      }
      if (configuration.route == Routes.REPOSITORY) {
        if (configuration.arguments.containsKey("user")) {
          UserViewModel? user = configuration.arguments["user"];
          if (user != null) {
            return RouteInformation(
                location: "/repository/${user.login}");
          }
        }
      }
    }
    return const RouteInformation(location: "/error");
  }
}
