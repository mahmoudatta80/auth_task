part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponseModel loginResponseModel) = _Success;
  const factory LoginState.failure(String errorMessage) = _Failure;
}
