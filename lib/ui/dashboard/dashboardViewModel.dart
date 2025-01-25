import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan/model/verify_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

import '../../components/success_page.dart';
import '../../network/api_services.dart';

class DashboardViewModel extends BaseViewModel {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  BookingResponse? response;

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

 void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      final code = result!.code!.split('/').last;
      debugPrint('QR Code: ${code}');
      debugPrint('QR Code: ${result!.code}');

      if (result != null) {
        controller.pauseCamera();
        setBusy(true);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');

       response =  await  ApiService.verifyBooking(code, token!);
        Navigator.of(qrKey.currentContext!).pop();
        if (response != null) {
        setBusy(false);
        notifyListeners();
        }

      }
    });
  }


}
