import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/globals/model/user_model.dart';
import 'package:test_app/modules/auth/data/source/auth_network_source.dart';
import 'package:test_app/modules/auth/domain/repository/auth.dart';
import 'package:test_app/utils/either.dart';

class AuthRepositoryImpl extends AuthRepository{

  final AuthNetworkSource source =AuthNetworkSource();

  @override
  Future<Either<Failure, String>> login(String email,String password) {
  return source.login(email, password);
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() {
   return source.getProfile();
  }

}