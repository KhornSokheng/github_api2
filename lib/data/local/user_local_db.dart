import 'package:github_api_v2/model/user/github_user.dart';
import 'package:hive/hive.dart';

class UserLocalDB {
  final String boxName = 'user';
  late var box;

  Future<void> initDB() async {
    box = await Hive.openBox<GitHubUser>(boxName);
  }

  Future<void> saveUser(List<GitHubUser> users) async {
    await initDB();
    // for(int i=0; i<users.length; i++){
    //   print(users[i].login);
    //   box.put(users[i].login, users[i]);
    // }

    //Not good
    // users.forEach((user) {box.put(user.login, user);});

    //Good
    for (var user in users) {box.put(user.login, user);}

  }

  GitHubUser getUserByUsername(String username)  {
    // await initDB();
    return box.get(username);
  }

  Future<void> getAllUser() async {}
}
