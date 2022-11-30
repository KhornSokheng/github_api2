
import 'package:hive/hive.dart';

part 'counter_model.g.dart';

@HiveType(typeId: 3)
class CounterModel extends HiveObject{

  CounterModel({runCounter});

  @HiveField(0 ,defaultValue: 0)
  int? runCounter;
  
}