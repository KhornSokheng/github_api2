import 'package:github_api_v2/model/user/github_user.dart';
import 'package:github_api_v2/route/route.dart';

import '../view_model/user/user_view_model.dart';

class Configuration {
  late Routes route;
  late Map<String, dynamic> arguments;

  Configuration({this.route = Routes.USER, Map<String, dynamic>? arguments}) {
    this.arguments = arguments ?? {};
  }

  Configuration.user(){
    route = Routes.USER;
    arguments = {};
  }

  Configuration.repository({required UserViewModel user}){
    route = Routes.REPOSITORY;
    arguments = {"user": user};

  }

  Configuration.unknown() {
    route = Routes.ERROR;
    arguments = {};
  }

  bool get isKnown {
    return route != Routes.ERROR;
  }


}
