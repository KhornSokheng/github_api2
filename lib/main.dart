import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:github_api_v2/route/route_information_parser.dart';
import 'package:github_api_v2/route/router_delegate.dart';
import 'package:github_api_v2/screen/repository/repository_screen.dart';
import 'package:github_api_v2/screen/user/user_screen.dart';
import 'package:github_api_v2/screen/util/not_found_page.dart';

import 'controller/user_controller.dart';
import 'model/github_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: MyRouteInformationParser(),
        routerDelegate: MyRouterDelegate()

        // onGenerateRoute: (settings){
        //   //Handle "/"
        //   if(settings.name =="/"){
        //     return MaterialPageRoute(builder: (context)=>UserScreen());
        //   }
        //
        //   //Handle "/repository/:username"
        //   var uri = Uri.parse(settings.name!);
        //   if (uri.pathSegments.length == 2 &&
        //       uri.pathSegments.first == 'repository') {
        //     var username = uri.pathSegments[1];
        //     return MaterialPageRoute(
        //         settings: RouteSettings(name: '/repository/$username'),
        //         builder: (context) => RepositoryScreen(username: username,)
        //     );
        //   }
        //
        //   return MaterialPageRoute(settings: RouteSettings(name: '/notfound'), builder: (context) => NotFoundPage());
        //
        // },
        );
  }
}
