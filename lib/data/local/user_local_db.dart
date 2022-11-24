import 'package:github_api_v2/model/github_user.dart';
import 'package:hive/hive.dart';

class UserLocalDB {
  final String boxName = 'user';
  late var box;

  Future<void> initDB()async {
    box = await Hive.openBox(boxName);
  }


  Future<void> saveUser(List<GitHubUser> users)async {
    await initDB();
    users.map((user) => box.put(user.login, user));


  }

  Future<void> getUserByUsername()async {

  }

  Future<void> getAllUser()async {

  }

}