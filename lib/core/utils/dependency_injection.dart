import 'package:auth_task/core/utils/api_service.dart';
import 'package:auth_task/features/login/data/repo_impl/login_repo_impl.dart';
import 'package:auth_task/features/login/domain/use_case/request_login_usecase.dart';
import 'package:auth_task/features/login/presentation/logic/login_bloc/login_bloc.dart';
import 'package:auth_task/features/register/data/repo_impl/register_repo_impl.dart';
import 'package:auth_task/features/register/domain/use_case/request_register_usecase.dart';
import 'package:auth_task/features/register/presentation/logic/register_bloc/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<LoginRepoImpl>(
      () => LoginRepoImpl(getIt<ApiService>()));
  getIt.registerLazySingleton<RequestLoginUseCase>(
      () => RequestLoginUseCase(getIt<LoginRepoImpl>()));
  getIt.registerFactory<LoginBloc>(
      () => LoginBloc(getIt<RequestLoginUseCase>()));

  getIt.registerLazySingleton<RegisterRepoImpl>(
      () => RegisterRepoImpl(getIt<ApiService>()));
  getIt.registerLazySingleton<RequestRegisterUsecase>(
      () => RequestRegisterUsecase(getIt<RegisterRepoImpl>()));
  getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(getIt<RequestRegisterUsecase>()));
}
