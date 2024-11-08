import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> execute(P param);
}

abstract class UseCaseNoParam<T> {
  Future<Either<Failure, T>> execute();
}
// class NoParam {}
