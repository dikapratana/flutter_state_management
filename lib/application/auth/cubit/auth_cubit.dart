import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:state_management/domain/auth/model/login_request.dart';
import 'package:state_management/domain/auth/model/login_response.dart';
import 'package:state_management/infrastructure/auth/auth_repository.dart';
import 'package:state_management/utils/constants.dart' as constants;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async {
    emit(AuthLoading());
    try {
      final data = await _authRepository.signInUser(loginRequest: loginRequest);
      data.fold((l) => emit(AuthError(l)), (r) => emit(AuthLoginSuccess(r)));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void saveUserToLocal(LoginResponse data) async {
    emit(AuthLoading());
    try {
      await GetStorage().write(constants.userLocalKey, jsonEncode(data));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void loadUserFromLocal() async {
    emit(AuthLoading());
    try {
      final data = await GetStorage().read(constants.userLocalKey);
      final result = LoginResponse.fromJson(jsonDecode(data));
      emit(AuthLoginSuccess(result));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
