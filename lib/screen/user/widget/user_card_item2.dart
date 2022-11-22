import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_api_v2/data/api_call.dart';
import 'package:github_api_v2/model/github_user.dart';
import 'package:github_api_v2/view_model/user/user_view_model.dart';

import '../../repository/repository_screen.dart';

class UserCardItem2 extends StatelessWidget {
  UserViewModel user;
  // const UserCardItem({Key? key}) : super(key: key);
  UserCardItem2({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;


    return Card(
      shadowColor: Colors.grey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: kIsWeb && width > 800 ? 120 : 80,
            width: kIsWeb && width > 800 ? 120 : 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.avatarUrl!)
                )
            ),
          ),
          Expanded(
            child: Column(
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
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: ()=>ApiCall().goToUrl(user.htmlUrl!),
                    child: Tooltip(
                      message: user.htmlUrl!,

                      child: AutoSizeText(user.htmlUrl!,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.arrow_forward_ios_outlined,
                color: Colors.black45,
              ),
            ),
          )

        ],
      ),
    );
  }
}
