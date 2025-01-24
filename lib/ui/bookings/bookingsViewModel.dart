import 'package:scan/model/verify_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../network/api_services.dart';

class BookingViewModel extends BaseViewModel {

 late AllBookingResponse data;



  Future<void> getBookings() async {
   setBusy(true);
   try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     data = await ApiService.getBookings(prefs.getString('token')!);
     setBusy(false);
     notifyListeners();
   } catch (e) {
     setBusy(false);
     notifyListeners();
     throw e;
   }
 }

}