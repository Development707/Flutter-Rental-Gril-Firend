import '../utils/date_time_utils.dart';

extension NumExtention on int {
  String get shortWeekDay => DateTimeUtils.day(this);
  String get weekDay => DateTimeUtils.weekDay(this);
}
