import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/repository_controller.dart';

class YearDropdownButton extends StatelessWidget {
  YearDropdownButton({Key? key}) : super(key: key);

  RepositoryController reposCtrl = Get.find();

  @override
  Widget build(BuildContext context) {

    // reposCtrl.setYearList();

    return GetBuilder<RepositoryController>(
      builder: (_) => DropdownButton(
        hint: Text("Year"),
        onChanged: (value) { reposCtrl.setSelectedYear(value.toString()); },
        // value: reposCtrl.selectedYear,
        // items: reposCtrl.yearList.map<DropdownMenuItem<String>>(
        //       (String value) {
        //         return DropdownMenuItem<String>(
        //           value: value,
        //           child: Text(value,),
        //
        //         );}
        //
        // ).toList(),
        items: ["2022"].map((e) => DropdownMenuItem(child: Text(e))).toList(),

      ),
    );
  }
}
