import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

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
        elevation: 2,
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
                    Expanded(
                      flex: 3,
                      child: AutoSizeText(
                        repository.name!,
                        // softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Chip(
                          backgroundColor: Colors.grey[300],
                          label: Text( repository.visibility ?? "",

                          ),
                        ),
                        Icon(Icons.more_vert_sharp,),
                      ],
                    ),

                  ],
                ),
                Divider(height: 8, thickness: 2, endIndent: 10,),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye,
                        color: Colors.black45
                    ),
                    SizedBox(width: 10,),
                    Text(
                      repository.watchersCount.toString(),
                    ),
                  ],
                ),
                AutoSizeText(
                  "Language: " + (repository.language == null ? "": repository.language),

                ),


                AutoSizeText(
                    "Updated: ${DateFormat.yMd().format(repository.updatedAt!)}",
                ),
                Row(
                  children: [
                    AutoSizeText("Branch: "),
                    Chip(
                      backgroundColor: Colors.grey[300],
                      label: Text( repository.defaultBranch ?? "",
                        style: TextStyle(
                          color: Colors.blueAccent[200],
                        ),
                      ),
                    ),

                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}
