import 'dart:io';

import 'package:auth_task/core/error/failure.dart';
import 'package:auth_task/core/error/server_failure.dart';
import 'package:auth_task/core/utils/api_service.dart';
import 'package:auth_task/core/utils/end_points.dart';
import 'package:auth_task/features/register/data/model/register_request_model.dart';
import 'package:auth_task/features/register/data/model/register_response_model.dart';
import 'package:auth_task/features/register/domain/repo/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterRepoImpl extends RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterResponseModel>> requestRegister(
      RegisterRequestModel registerRequestModel) async {
    try {
      Map<String, dynamic> response = await apiService.registerPost(
        endPoint: EndPoints.register,
        data: {
          'email': registerRequestModel.email,
          'password': registerRequestModel.password,
          'confirmPassword': registerRequestModel.password,
          'phone': registerRequestModel.phone,
          'name': registerRequestModel.name,
          'location':
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        },
      );
      RegisterResponseModel registerResponseModel =
          RegisterResponseModel.fromJson(response);
      return Right(registerResponseModel);
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
