import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/login/data/model/login_request_model.dart';
import 'package:auth_task/features/login/data/model/login_response_model.dart';
import 'package:auth_task/features/login/domain/use_case/request_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestLoginUseCase requestLoginUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBloc(this.requestLoginUseCase) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        requestLoginEvent: (loginRequestModel) async {
          requestLoading = true;
          emit(const LoginState.loading());
          Either<Failure, LoginResponseModel> result =
              await requestLoginUseCase.call(loginRequestModel);
          if (isClosed) {
            return;
          }
          result.fold(
            (failure) {
              requestLoading = false;
              emit(LoginState.failure(failure.message));
            },
            (loginResponseModel) {
              requestLoading = false;
              emit(LoginState.success(loginResponseModel));
            },
          );
        },
      );
    });
  }
}
