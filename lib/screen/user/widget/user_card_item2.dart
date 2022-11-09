import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_api_v2/model/github_user.dart';

import '../../repository/repository_screen.dart';

class UserCardItem2 extends StatelessWidget {
  GitHubUser user;
  // const UserCardItem({Key? key}) : super(key: key);
  UserCardItem2({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = Get.mediaQuery.size.width ;
    print(width);

    return InkWell(
      onTap: () => Get.to(() => RepositoryScreen(user: user)),

      child: Card(
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.avatarUrl!)
                  )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  user.login!,
                  maxLines: 1,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,


                  ),
                ),
                SizedBox(height: 15),
                AutoSizeText(user.htmlUrl!,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    // fontSize: 16
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
