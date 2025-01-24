import 'package:flutter/material.dart';
import 'package:scan/network/api_services.dart';
import 'package:scan/ui/dashboard/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class DioClient {
  late Dio dio;
  DioClient() {
    dio = Dio();
    // Add any necessary interceptors or configurations here (optional)
  }

  void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}

// Initialize the service locator
final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerSingleton(SnackbarService());
}

class AuthViewModel extends BaseViewModel {
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;
  bool remember = false;

  // Access SnackbarService via locator
  final snackBar = locator<SnackbarService>();

  void toggleRemember() {
    remember = !remember;
    rebuildUi();
  }

  void toggleObscure() {
    obscure = !obscure;
    rebuildUi();
  }

  Future<void> login(BuildContext context) async {
    setBusy(true);

    await ApiService.login(email.text, password.text).then((value) {
      // Save the token to shared preferences
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('token', value.token);
      });

      // Navigate to the next page
      debugPrint("Login successful: ${value.msg}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardView()),
      );

    }).onError((error, stackTrace) {
      debugPrint("Error during login: $error");
      debugPrint("Stack trace: $stackTrace");

      // Show error message using SnackbarService
      snackBar.showSnackbar(message: 'wrong login', duration: Duration(seconds: 3));


      debugPrint("Error during login: $error");
    }).whenComplete(() {
      setBusy(false);
    });
  }
}
