import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:state_management/domain/auth/model/login_request.dart';
import 'package:state_management/domain/auth/model/login_response.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<Either<String, LoginResponse>> signInUser(
      {required LoginRequest loginRequest}) async {
    Response response;
    try {
      response = await _dio.post('https://reqres.in/api/login',
          data: loginRequest.toJson());
      LoginResponse loginresponse = LoginResponse.fromJson(response.data);
      return right(loginresponse);
    } on DioError catch (e) {
      String errorMessage = e.response?.data['error'];
      return left(errorMessage);
    }
  }
}
