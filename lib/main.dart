import 'package:flutter/material.dart';
import 'package:scan/common/app_colors.dart';
import 'package:scan/network/api_services.dart';
import 'package:scan/ui/auth/auth_viewmodel.dart';
import 'package:scan/ui/dashboard/dashboard_view.dart';
import 'package:scan/ui/startup/startup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getInitialView() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // If a token exists, navigate to the Dashboard, otherwise go to Login
    return token != null ?  DashboardView() : const StartupView();
    //return StartupView();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getInitialView(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else {
          return MaterialApp(
            title: 'theCans App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kcPrimaryColor),
              useMaterial3: true,
            ),
            home: snapshot.data,
          );
        }
      },
    );
  }
}


