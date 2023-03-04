import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management/domain/auth/model/login_request.dart';
import 'package:state_management/domain/auth/model/login_response.dart';
import 'package:state_management/infrastructure/auth/auth_repository.dart';

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
}
