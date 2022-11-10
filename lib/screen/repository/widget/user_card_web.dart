import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_api_v2/model/github_user.dart';

import '../../repository/repository_screen.dart';

class UserCardWeb extends StatelessWidget {
  GitHubUser user;
  // const UserCardItem({Key? key}) : super(key: key);
  UserCardWeb({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(width);

    return SizedBox(
      width: width*0.7,
      height: 150,

      child: Card(
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              height: kIsWeb || width >500 ? 120 : 80,
              width: kIsWeb || width >500 ? 120 : 80,
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
                Row(
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
                    // AutoSizeText(user.htmlUrl!,
                    //   maxLines: 2,
                    //   style: const TextStyle(
                    //     color: Colors.grey,
                    //     fontWeight: FontWeight.bold,
                    //     // fontSize: 16
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AutoSizeText(
                      "7 Repositories",
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalDivider(
                      width: 20,
                      thickness: 3,
                      color: Colors.blueAccent,
                    ),
                    AutoSizeText(
                      "10 Followers",
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalDivider(
                      width: 20,
                      thickness: 3,
                      color: Colors.blueAccent,
                    ),
                    AutoSizeText(
                      "10 Followings",
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
