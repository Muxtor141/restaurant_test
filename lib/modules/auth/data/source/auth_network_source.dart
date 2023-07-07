import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_app/core/assets/constants/app_urls.dart';
import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/core/data/singleton/dio.dart';
import 'package:test_app/core/data/singleton/service_locator.dart';
import 'package:test_app/core/data/singleton/storage.dart';
import 'package:test_app/globals/model/user_model.dart';
import 'package:test_app/utils/either.dart';

class AuthNetworkSource {
  final client = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, String>> login(String email, String password) async {

    Map<String,dynamic> data={"email": email, "password": password};

    print(data.toString());
    final tokenResponse = await client.post(AppUrls.baseUrl + AppUrls.login,
        data: data);
    print(tokenResponse.realUri.toString() + '  url141');
    print(tokenResponse.data);
    print(tokenResponse.statusCode);
    if (tokenResponse.statusCode! >= 200 && tokenResponse.statusCode! < 300) {
      final token = tokenResponse.data['tokens']['accessToken'];
      unawaited(StorageRepository.putString('token', token));

      return Right('');
    }else {

      String? message;
      message=tokenResponse.data['message'];
      if(message!=null){
        return Left(ServerFailure(message: message));
      }else {
        return Left(ServerFailure(message: 'Server error '));
      }
    }


  }

  Future<Either<Failure, UserModel>> getProfile(
    ) async {
    final result = await client.get(AppUrls.baseUrl + AppUrls.profile,
        options: Options(headers: {
          "Authorization": "Bearer ${StorageRepository.getString('token')}"
        }));
    print(result.realUri.toString() + '  url141');
    print(result.data);
    print(result.statusCode);
    if (result.statusCode! >= 200 && result.statusCode! < 300) {
      final data = UserModel.fromJson(result.data);

      return Right(data);
    } else {

      String? message;
      message=result.data['message'];
      if(message!=null){
        return Left(ServerFailure(message: message));
      }else {
        return Left(ServerFailure(message: 'Server error '));
      }

    }
  }
}
