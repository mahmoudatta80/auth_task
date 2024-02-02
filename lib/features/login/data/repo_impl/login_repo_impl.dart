import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/core/error/server_failure.dart';
import 'package:auth_task/core/utils/api_service.dart';
import 'package:auth_task/core/utils/end_points.dart';
import 'package:auth_task/features/login/data/model/login_request_model.dart';
import 'package:auth_task/features/login/data/model/login_response_model.dart';
import 'package:auth_task/features/login/domain/repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponseModel>> requestLogin(
      LoginRequestModel loginRequestModel) async {
    try {
      Map<String, dynamic> response = await apiService.loginPost(
        endPoint: EndPoints.login,
        data: {
          'email': loginRequestModel.email,
          'password': loginRequestModel.password,
        },
      );
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response);
      return Right(loginResponseModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }
}
