import 'package:dio/dio.dart';
import 'package:test_app/core/assets/constants/app_urls.dart';
import 'package:test_app/core/data/singleton/storage.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: Duration(seconds: 35),
    receiveTimeout: Duration(seconds: 33),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: Duration(seconds: 35),
      receiveTimeout: Duration(seconds: 33),
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  // final _dio = serviceLocator<DioSettings>().dio; ///sample
  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions);
}
