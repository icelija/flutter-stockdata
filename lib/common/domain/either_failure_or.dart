import 'package:dartz/dartz.dart';

import 'entities/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
typedef StreamFailureOr<T> = Stream<Either<Failure, T>>;
