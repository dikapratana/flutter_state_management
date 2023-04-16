import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management/domain/core/user/model/user_req_res.dart';
import 'package:state_management/domain/core/user/user_data.dart';
import 'package:state_management/infrastructure/user/user_repository.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial());
  final UserRepository _userRepository = UserRepository();

  void createNewUSer(RequestData requestData) async {
    emit(const UserState.loading());
    try {
      final data = await _userRepository.createNewUser(requestData);
      data.fold(
          (l) => emit(UserState.error(l)), (r) => emit(UserState.success(r)));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
