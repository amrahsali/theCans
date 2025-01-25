import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../network/api_services.dart';
import '../../model/verify_model.dart';

class BookingViewModel extends BaseViewModel {
  late AllBookingResponse data; // Holds the list of bookings

  Future<void> getBookings() async {
    setBusy(true); // Indicates loading

    
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null || token.isEmpty) {
        throw Exception('Token not found');
      }
      data = await ApiService.getBookings(token);
    } catch (e) {
      // Handle the exception (e.g., logging or showing an error message)
      debugPrint(e.toString());
    } finally {
      setBusy(false); // Indicates loading complete
    }
  }
}
