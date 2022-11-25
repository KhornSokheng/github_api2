import 'package:github_api_v2/model/repository/repository_model.dart';
import 'package:hive/hive.dart';

class RepositoryLocalDB{
  final boxName = 'repository';
  late var reposBox;

  Future<void> initDB() async {
    reposBox = await Hive.openBox<List<Repository>>(boxName);

  }

  Future<void> saveRepository(String username, List<Repository> repositories)async {
    await initDB();
    // for (var repository in repositories) {box.put(repository.name, repository);}

    //store as 'username' and 'List of repository'
    reposBox.put(username, repositories);

    List<Repository> tmp = getRepository(username);
    print(tmp.length);

  }

  List<Repository> getRepository(String username)  {
    // await initDB();
    return reposBox.get(username);
  }

}