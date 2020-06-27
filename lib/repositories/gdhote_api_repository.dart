// GDHOTEBASE base URL
import 'package:dio/dio.dart';
import 'package:gdhote/models/create_user/create_user_model.dart';
import 'package:gdhote/models/response/response_model.dart';
import 'package:gdhote/models/signin/signin_model.dart';
import 'package:gdhote/utils/helpers/dio_config.dart';

const String BASE_URL = 'https://gdhotebase.com.ng/';

// Endpoints
const String CreateUser = 'createuser';
const String Logout = 'logout';
const String Login = 'login';
const String AddWater = 'addwater';
const String WaterStatusID = 'waterstatusid';

class GdhoteApiRepository {
  static Future<ResponseModel> createUser(
      CreateUserModel createUserModel) async {
    final dio = DioConfig.getDio;
    final url = BASE_URL + CreateUser;

    dio.interceptors
      ..addAll(
        [
          DioResponseInterceptor(),
        ],
      );

    try {
      Response<ResponseModel> response = await dio.post(
        url,
        data: createUserModel.toJson(),
      );

      return response.data;
    } on DioError {
      return null;
    }
  }

  static Future<ResponseModel> loginUser(SignInModel signInModel) async {
    final dio = DioConfig.getDio;
    final url = BASE_URL + Login;

    dio.interceptors
      ..addAll(
        [
          DioResponseInterceptor(),
        ],
      );

    try {
      Response<ResponseModel> response = await dio.post(
        url,
        data: signInModel.toJson(),
      );

      return response.data;
    } on DioError {
      return null;
    }
  }
}
