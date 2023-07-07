import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/core/data/usecases/usecase.dart';
import 'package:test_app/modules/auth/domain/repository/auth.dart';
import 'package:test_app/utils/either.dart';

class LoginUseCase extends UseCase<String, LoginParams> {
  final AuthRepository repo;

  LoginUseCase({required this.repo});

  @override
  Future<Either<Failure, String>> call(LoginParams param) {
    return repo.login(param.email, param.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.password, required this.email});
}
