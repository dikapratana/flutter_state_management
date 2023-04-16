import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:state_management/domain/core/user/model/user_req_res.dart';
import 'package:state_management/domain/core/user/user_data.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<Either<String, UserData>> createNewUser(
      RequestData requestData) async {
    Response response;
    try {
      response = await _dio.post('https://reqres.in/api/users',
          data: requestData.toJson());
      final result = response.data;
      return right(UserData.fromJson(result));
    } on DioError catch (e) {
      String errorMessage = e.response?.data['error'];
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
        default:
      }
      return left(errorMessage);
    }
  }
}
