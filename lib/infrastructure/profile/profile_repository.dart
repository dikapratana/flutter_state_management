import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:state_management/domain/core/user/model/user_response.dart';

class ProfileRepository {
  final Dio _dio = Dio();

  Future<Either<String, UserResponse>> getALLUserData() async {
    Response response;
    try {
      response = await _dio.get('https://reqres.in/api/users?page=2');
      UserResponse userResponse = UserResponse.fromJson(response.data);
      return right(userResponse);
    } on DioError catch (e) {
      String errorMessage = e.response?.data['error'];
      return left(errorMessage);
    }
  }
}
