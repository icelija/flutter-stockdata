import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;

  const factory NewsState.loading(NewsEntity? data) = _Loading;

  const factory NewsState.loaded(NewsEntity data) = _Data;

  const factory NewsState.failure(Failure failure) = _Failure;
}
