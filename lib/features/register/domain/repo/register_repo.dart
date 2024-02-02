import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/register/data/model/register_request_model.dart';
import 'package:auth_task/features/register/data/model/register_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterResponseModel>> requestRegister(
      RegisterRequestModel registerRequestModel);
}
