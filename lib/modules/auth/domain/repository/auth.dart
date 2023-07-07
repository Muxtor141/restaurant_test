import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/globals/model/user_model.dart';
import 'package:test_app/utils/either.dart';

abstract class AuthRepository {
  Future<Either<Failure,String>> login(String email,String password);
  Future<Either<Failure,UserModel>> getProfile();
}