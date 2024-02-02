import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/login/data/model/login_request_model.dart';
import 'package:auth_task/features/login/data/model/login_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponseModel>> requestLogin(LoginRequestModel loginRequestModel);
}