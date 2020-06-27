import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gdhote/models/response/response_model.dart';

class DioConfig {
  static BaseOptions options = BaseOptions(
    connectTimeout: 5500,
    receiveTimeout: 3500,
  );

  static Dio get getDio {
    Dio dio = Dio(options);
    dio.interceptors..add(LogInterceptor());
    return dio;
  }
}

class DioResponseInterceptor implements Interceptor {
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> result =
          (response.data as List<dynamic>)[0] as Map<String, dynamic>;

      ResponseModel responseModel = ResponseModel.fromJson(result);

      return response..data = responseModel;
    }

    return response;
  }

  @override
  Future<DioError> onError(DioError err) async {
    return err;
  }
}
