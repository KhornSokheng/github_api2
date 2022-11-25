import 'package:github_api_v2/model/user/github_user.dart';

class UserViewModel{
  final GitHubUser user;
  UserViewModel({required this.user});

  String get login => user.login ?? "";
  String get htmlUrl => user.htmlUrl ?? "";
  String get avatarUrl => user.avatarUrl ?? " ";


}