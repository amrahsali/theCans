import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: "https://api.thecans.ng/api/v1", // Replace with your base URL
      connectTimeout: const Duration(seconds: 30), // Connection timeout
      receiveTimeout: const Duration(seconds: 30), // Response timeout
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  Dio get dio => _dio;
}
