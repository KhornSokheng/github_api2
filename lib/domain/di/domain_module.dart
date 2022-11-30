import 'package:github_api_v2/model/repository/repository_model.dart';
import 'package:github_api_v2/model/user/github_user.dart';
import 'package:hive/hive.dart';

import '../../model/counter/counter_model.dart';

Future<void> registerHiveAdapter()async {
  Hive.registerAdapter<GitHubUser>(GitHubUserAdapter());
  Hive.registerAdapter<Repository>(RepositoryAdapter());
  Hive.registerAdapter<CounterModel>(CounterModelAdapter());

}