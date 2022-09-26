import 'package:freezed_annotation/freezed_annotation.dart';

import '../other/typedefs.dart';

part 'pagintion.freezed.dart';
part 'pagintion.g.dart';

/// Convention, habit or type of the identifiers `camelCase`
@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey() @Default(1) int currentPage,
    @JsonKey() @Default(false) bool hasMore,
    @JsonKey() int? totalItems,
    @JsonKey() int? totalPage,
    @JsonKey() int? itemsPerPage,
  }) = _Pagination;

  // To JSON
  const Pagination._();

  factory Pagination.fromJson(JSON json) => _$PaginationFromJson(json);
}

/// Convention, habit or type of the identifiers `underscores`
@freezed
class Pagination2 with _$Pagination2 {
  const factory Pagination2({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'has_more') @Default(false) bool hasMore,
    @JsonKey(name: 'total_items') int? totalItems,
    @JsonKey(name: 'total_page') int? totalPage,
    @JsonKey(name: 'items_per_page') int? itemsPerPage,
  }) = _Pagination2;

  // To JSON
  const Pagination2._();

  factory Pagination2.fromJson(JSON json) => _$Pagination2FromJson(json);
}
