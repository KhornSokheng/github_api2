import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_api_v2/data/api_call.dart';
import 'package:github_api_v2/model/user/github_user.dart';

import '../../../view_model/user/user_view_model.dart';
import '../../repository/repository_screen.dart';

class UserCardWeb extends StatelessWidget {
  UserViewModel user;
  // const UserCardItem({Key? key}) : super(key: key);
  UserCardWeb({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width>800 ? width*0.7 : width*0.9,
      height: 150,

      child: Card(
        shadowColor: Colors.grey,
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: kIsWeb ? EdgeInsets.symmetric(horizontal: 80):EdgeInsets.symmetric(horizontal: 20),
              height: kIsWeb && width > 800 ? 120 : 80,
              width: kIsWeb && width > 800 ? 120 : 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.avatarUrl!)
                  )
              ),
            ),
            ClipRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => ApiCall().goToUrl(user.htmlUrl!),
                          child: AutoSizeText(
                            user.login!,
                            maxLines: 1,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDetail("30 Repositories"),
                      buildDetail("10 Followers"),
                      buildDetail("10 Followings"),
                      buildDetail("233 Contributions"),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildDetail(String text){
    return Row(
      children: [
        AutoSizeText(
          text,
          maxLines: 1,
          softWrap: true,
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalDivider(
          width: 20,
          thickness: 3,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}
