import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading(SearchEntity? data) = _Loading;

  const factory SearchState.loaded(SearchEntity data) = _Data;

  const factory SearchState.failure(Failure failure) = _Failure;
}
