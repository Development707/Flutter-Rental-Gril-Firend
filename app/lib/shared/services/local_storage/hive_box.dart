import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox extends HiveObject {
  HiveBox({required this.boxName});

  final String boxName;

  @HiveField(0)
  late String id;
}
