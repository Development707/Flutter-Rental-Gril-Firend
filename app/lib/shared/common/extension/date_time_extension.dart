extension DateTimeExtension on DateTime {
  DateTime copyWith(
      {int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime get dateOnly => DateTime(year, month, day);

  bool isSameDate(DateTime anotherDate) =>
      dateOnly.isAtSameMomentAs(anotherDate.dateOnly);
  bool isSameTime(DateTime anotherDate) =>
      hour == anotherDate.hour && minute == anotherDate.minute;
}
