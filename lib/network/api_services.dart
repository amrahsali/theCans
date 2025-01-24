import 'package:dio/dio.dart';
import 'package:scan/model/user_model.dart';
import 'package:scan/network/dio_client.dart';

import '../model/verify_model.dart';

class ApiService {
  static late Dio _dio;
  ApiService.init(){
    // instantiate the _dio
    _dio = DioClient().dio;
  }
  static Future<UserResponse> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final data = UserResponse.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<BookingResponse> verifyBooking(String id, String token) async {
    try {
      final response = await _dio.get('/bookings/$id', options: Options(headers: {
        "Authorization":"Bearer $token"
      }));
      final data = BookingResponse.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<AllBookingResponse> getBookings(String token) async {
    try {
      final response = await _dio.get('/bookings', options: Options(headers: {
      "Authorization":"Bearer $token"
      }));
      final data = AllBookingResponse.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }



}