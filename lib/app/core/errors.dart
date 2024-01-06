import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic failureData;
  const Failure(this.failureData);
  @override
  List<Object> get props => [];
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.failureData);
}

class ServerFailure extends Failure {
  const ServerFailure(super.failureData);
}

class CacheFailure extends Failure {
  const CacheFailure(super.failureData);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.failureData);
}

class NotAuthorizedFailure extends Failure {
  const NotAuthorizedFailure(super.failureData);
}
