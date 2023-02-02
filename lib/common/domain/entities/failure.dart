import 'package:equatable/equatable.dart';

import '../../../generated/l10n.dart';

class Failure extends Equatable {
  final String title;
  final dynamic error;
  final StackTrace? stackTrace;

  const Failure._({
    required this.title,
    this.error,
    this.stackTrace,
  });

  factory Failure.generic({
    String? title,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      Failure._(
        title: title ?? S.current.unknown_error_occurred,
        error: error,
        stackTrace: stackTrace,
      );

  Failure copyWith({
    String? title,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      Failure._(
        title: title ?? this.title,
        error: error ?? this.error,
        stackTrace: stackTrace ?? this.stackTrace,
      );

  @override
  List<Object?> get props => [
        title,
        error,
        stackTrace,
      ];

  @override
  bool? get stringify => true;
}
