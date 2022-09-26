import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox extends HiveObject {
  @HiveField(0)
  late String id;
}
