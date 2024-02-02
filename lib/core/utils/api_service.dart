import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://food-api-omega.vercel.app/api/v1/user/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> loginPost({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> registerPost({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      data: FormData.fromMap(data),
    );
    return response.data;
  }
}
