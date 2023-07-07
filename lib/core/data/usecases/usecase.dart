
import 'package:equatable/equatable.dart';
import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/utils/either.dart';



abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
