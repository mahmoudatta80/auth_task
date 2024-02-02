part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.requestRegisterEvent(RegisterRequestModel registerRequestModel) = _RequestRegisterEvent;
}
