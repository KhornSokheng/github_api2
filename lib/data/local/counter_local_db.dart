import 'package:flutter/foundation.dart';
import 'package:github_api_v2/model/counter/counter_model.dart';
import 'package:hive/hive.dart';

class CounterLocalDB {
  final String boxName = 'counter';
  late Box counterbox;
  final key = 'counter_key2';

  Future<void> initDB() async {
    counterbox = await Hive.openBox<CounterModel>(boxName);
  }

  Future<void> updateCounter() async{
    // await initDB();
    counterbox = Hive.box<CounterModel>(boxName);
    CounterModel tmp = getCurrentCounter();
    tmp.runCounter = (tmp.runCounter??0) + 1;
    counterbox.put(key, tmp);
    if (kDebugMode) {
      print("New: ${(getCurrentCounter()).runCounter}");
    }
  }

  CounterModel getCurrentCounter() {
    // await initDB();
    counterbox = Hive.box<CounterModel>(boxName);
    return counterbox.get(key, defaultValue: CounterModel(runCounter: 0));
  }

}
