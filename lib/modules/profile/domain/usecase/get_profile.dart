import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/core/data/usecases/usecase.dart';
import 'package:test_app/globals/entity/user.dart';
import 'package:test_app/globals/model/user_model.dart';
import 'package:test_app/modules/auth/domain/repository/auth.dart';
import 'package:test_app/utils/either.dart';

class GetProfileUseCase extends UseCase<UserEntity,String>{
  final AuthRepository repo;
  GetProfileUseCase({required this.repo});


  @override
  Future<Either<Failure, UserModel>> call(String params) {
return repo.getProfile();
  }

}