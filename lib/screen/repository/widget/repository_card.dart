import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../model/repository_model.dart';

class RepositoryCard extends StatelessWidget {

  Repository repository;
  RepositoryCard({required this.repository});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog();
      },
      child: Card(
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15,15,0,10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      repository.name!,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.more_vert_sharp,
                    ),
                  ],
                ),
                AutoSizeText(
                  "Language: " + (repository.language == null ? "": repository.language),

                ),
                AutoSizeText(
                  repository.visibility ?? "",

                ),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5,),
                    AutoSizeText(
                      repository.watchersCount.toString(),
                    ),
                  ],
                ),
                AutoSizeText(
                  repository.updatedAt.toString(),
                ),
                AutoSizeText(
                  repository.htmlUrl!,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
