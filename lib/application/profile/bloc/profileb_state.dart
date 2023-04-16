part of 'profileb_bloc.dart';

@freezed
class ProfilebState with _$ProfilebState {
  const factory ProfilebState.initial() = _Initial;
  const factory ProfilebState.isLoading() = _IsLoading;
  const factory ProfilebState.isError(String errorMessage) = _IsError;
  const factory ProfilebState.isSuccess(UserResponse userResponse) = _IsSuccess;
}
