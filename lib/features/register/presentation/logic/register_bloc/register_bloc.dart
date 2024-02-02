import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/register/data/model/register_request_model.dart';
import 'package:auth_task/features/register/data/model/register_response_model.dart';
import 'package:auth_task/features/register/domain/use_case/request_register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RequestRegisterUsecase requestRegisterUsecase;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool requestLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterBloc(this.requestRegisterUsecase)
      : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.when(
        requestRegisterEvent: (registerRequestModel) async {
          requestLoading = true;
          emit(const RegisterState.loading());
          Either<Failure, RegisterResponseModel> result =
              await requestRegisterUsecase.call(registerRequestModel);
          if (isClosed) {
            return;
          }
          result.fold(
            (failure) {
              requestLoading = false;
              emit(RegisterState.failure(failure.message));
            },
            (registerResponseModel) {
              requestLoading = false;
              emit(RegisterState.success(registerResponseModel));
            },
          );
        },
      );
    });
  }
}
