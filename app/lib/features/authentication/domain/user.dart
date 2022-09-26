// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey() required int id,
    @JsonKey() String? firstName,
    @JsonKey() String? lastName,
    @JsonKey() String? shownName,
    @JsonKey() String? avatarUrl,
    @JsonKey() @Default(0) int gender,
    @JsonKey() @Default(0) int status,
    @JsonKey() DateTime? formatBirthDay,
    @JsonKey() String? nationality,
    @JsonKey() String? phone,
    @JsonKey() String? email,
  }) = _User;

  // To JSON
  const User._();

  factory User.fromJson(JSON json) => _$UserFromJson(json);
}
