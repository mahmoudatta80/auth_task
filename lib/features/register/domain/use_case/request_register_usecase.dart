import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/register/data/model/register_request_model.dart';
import 'package:auth_task/features/register/data/model/register_response_model.dart';
import 'package:auth_task/features/register/domain/repo/register_repo.dart';
import 'package:dartz/dartz.dart';

class RequestRegisterUsecase {
  final RegisterRepo registerRepo;

  RequestRegisterUsecase(this.registerRepo);

  Future<Either<Failure, RegisterResponseModel>> call(
      RegisterRequestModel registerRequestModel) async {
    return await registerRepo.requestRegister(registerRequestModel);
  }
}
