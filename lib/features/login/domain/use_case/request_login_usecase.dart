import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/features/login/data/model/login_request_model.dart';
import 'package:auth_task/features/login/data/model/login_response_model.dart';
import 'package:auth_task/features/login/domain/repo/login_repo.dart';
import 'package:dartz/dartz.dart';

class RequestLoginUseCase {
  final LoginRepo loginRepo;

  RequestLoginUseCase(this.loginRepo);

  Future<Either<Failure, LoginResponseModel>> call(
      LoginRequestModel loginRequestModel) async {
    return await loginRepo.requestLogin(loginRequestModel);
  }
}
