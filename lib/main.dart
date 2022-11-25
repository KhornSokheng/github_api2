import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:github_api_v2/route/route_information_parser.dart';
import 'package:github_api_v2/route/router_delegate.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'domain/di/domain_module.dart';

void main() async {

  await Hive.initFlutter();
  await registerHiveAdapter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        title: 'GitHub User API 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: MyRouteInformationParser(),
        routerDelegate: MyRouterDelegate());
  }
}
