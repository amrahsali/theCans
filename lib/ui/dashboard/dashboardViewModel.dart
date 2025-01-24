import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

import '../../network/api_services.dart';
import 'BookingdetailsScreen.dart';

class DashboardViewModel extends BaseViewModel {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Method to update the current index
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Method to update the current index
  void onTabChange(int index) {
    _currentIndex = index;

    // Handle specific logic for each tab if needed
    switch (index) {
      case 0:
        // Logic for Dashboard Tab
        print('Dashboard tab selected');
        break;
      case 1:
        // Logic for Record View Tab
        print('Record tab selected');
        break;
      default:
        break;
    }

    notifyListeners();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) async {
  //     result = scanData;
  //     final code = result!.code!.split('/').last;
  //     debugPrint('QR Code: ${code}');
  //     if (result != null) {
  //       controller.pauseCamera();
  //       setBusy(true);
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       final token = prefs.getString('token');
  //
  //       ApiService.verifyBooking(code, token!).then((value) => {
  //             debugPrint('Response: ${value}'),
  //           });
  //     }
  //   });
  // }



  void onQRViewCreated(QRViewController controller, context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      final code = result!.code!.split('/').last;
      debugPrint('QR Code: ${code}');
      if (result != null) {
        controller.pauseCamera();
        setBusy(true);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');

        try {
          final response = await ApiService.verifyBooking(code, token!);
          debugPrint('Response: ${response}');

          // Navigate to a details screen and pass the booking data
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookingDetailsScreen(bookingData: response['data'])
              )
          );
        } catch (e) {
          // Handle error
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Booking verification failed'))
          );
        } finally {
          setBusy(false);
        }
      }
    });
  }



}
