import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../localization/generated/l10n.dart';

class DateTimeUtils {
  const DateTimeUtils._();

  static String day(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return AppLanguage.current.monday_s;

      case 2:
        return AppLanguage.current.tuesday_s;

      case 3:
        return AppLanguage.current.wednesday_s;

      case 4:
        return AppLanguage.current.thursday_s;

      case 5:
        return AppLanguage.current.friday_s;

      case 6:
        return AppLanguage.current.saturday_s;

      case 7:
        return AppLanguage.current.sunday_s;

      default:
        return AppLanguage.current.monday_s;
    }
  }

  static String weekDay(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return AppLanguage.current.monday;

      case 2:
        return AppLanguage.current.tuesday;

      case 3:
        return AppLanguage.current.wednesday;

      case 4:
        return AppLanguage.current.thursday;

      case 5:
        return AppLanguage.current.friday;

      case 6:
        return AppLanguage.current.saturday;

      case 7:
        return AppLanguage.current.sunday;

      default:
        return AppLanguage.current.monday;
    }
  }

  static String relative(
    DateTime? dateTime, {
    Duration? formatAfter,
    Duration? timeShowNow,
  }) {
    // After now
    final DateTime now = DateTime.now();
    if (dateTime!.isAfter(now)) {
      return DateFormat.yMd().format(dateTime);
    }
    // Before formatAfter
    final Duration difference = dateTime.difference(now).abs();
    if (formatAfter != null && difference >= formatAfter) {
      return DateFormat.yMd().format(dateTime);
    }
    // Less timeShowNow
    if (timeShowNow != null && difference < timeShowNow) {
      return AppLanguage.current.now;
    }
    // Defaut
    if (difference < const Duration(minutes: 1)) {
      return AppLanguage.current.few_seconds_ago;
    } else if (difference < const Duration(hours: 1)) {
      return AppLanguage.current.minutes_relative(difference.inMinutes);
    } else if (difference < const Duration(days: 1)) {
      return AppLanguage.current.hours_relative(difference.inHours);
    } else if (difference < const Duration(days: 30)) {
      return AppLanguage.current.days_relative(difference.inDays);
    } else if (difference < const Duration(days: 90)) {
      return DateFormat.Md().format(dateTime);
    } else {
      return DateFormat.yMd().format(dateTime);
    }
  }

  static String fromDurationNumToText(BuildContext context, double? duration,
      {bool withUnit = false}) {
    duration ??= 0;
    if (duration < 1) {
      return '${(duration * 60).ceil()}${withUnit ? ' ${AppLanguage.of(context).minutes}' : ''}';
    }
    return '${duration.round()}${withUnit ? ' ${AppLanguage.of(context).hours}' : ''}';
  }

  static String fromDurationToText(BuildContext context, Duration duration) {
    if (duration.inHours == 0) {
      return '0:${duration.inMinutes}:00';
    }
    return '${duration.inHours}:00:00';
  }
}
