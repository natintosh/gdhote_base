import 'package:gdhote/models/create_user/create_user_model.dart';
import 'package:gdhote/models/response/response_model.dart';
import 'package:gdhote/repositories/gdhote_api_repository.dart';
import 'package:tuple/tuple.dart';

class GdhoteApiService {
  static Future<Tuple2<bool, String>> createUser({
      CreateUserModel createUserModel}) async {
    ResponseModel response =
        await GdhoteApiRepository.createUser(createUserModel);

    if (response == null) {
      return Tuple2<bool, String>(false, 'An unknown error occurred');
    }

    return Tuple2<bool, String>(
      _isStatusSuccess(response.status),
      response.userMessage,
    );
  }
}

bool _isStatusSuccess(String status) {
  return status.toLowerCase() == 'success';
}
