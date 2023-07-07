import 'package:get_it/get_it.dart';
import 'package:test_app/core/data/singleton/dio.dart';
import 'package:test_app/core/data/singleton/storage.dart';
import 'package:test_app/modules/auth/data/repository/auth_impl.dart';




final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(DioSettings.new);
  serviceLocator.registerLazySingleton(AuthRepositoryImpl.new);

}
