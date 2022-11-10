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
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.remove_red_eye,
                      color: Colors.black45
                    ),
                  ),
                  label: Text(
                    repository.watchersCount.toString(),
                  ),
                    backgroundColor: Colors.grey[300],
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),

                ),
                AutoSizeText(
                  "Language: " + (repository.language == null ? "": repository.language),

                ),


                AutoSizeText(
                  repository.updatedAt.toString(),
                ),
                Row(
                  children: [
                    AutoSizeText("default branch: "),
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
