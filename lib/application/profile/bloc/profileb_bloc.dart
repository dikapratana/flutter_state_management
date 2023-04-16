import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management/domain/core/user/model/user_response.dart';
import 'package:state_management/infrastructure/profile/profile_repository.dart';

part 'profileb_event.dart';
part 'profileb_state.dart';
part 'profileb_bloc.freezed.dart';

class ProfilebBloc extends Bloc<ProfilebEvent, ProfilebState> {
  ProfilebBloc() : super(const _Initial()) {
    ProfileRepository profileRepository = ProfileRepository();
    on<ProfilebEvent>((event, emit) async {
      emit(const ProfilebState.isLoading());

      try {
        final result = await profileRepository.getALLUserData();
        result.fold((l) => emit(ProfilebState.isError(l)),
            (r) => emit(ProfilebState.isSuccess(r)));
      } catch (e) {
        emit(ProfilebState.isError(e.toString()));
      }
    });
  }
}
