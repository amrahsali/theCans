import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan/common/app_colors.dart';
import 'package:scan/components/success_page.dart';
import 'package:stacked/stacked.dart';
import '../../components/submit_button.dart';
import '../bookings/bookings_view.dart';
import 'dashboardViewModel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/svg.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Admin!',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kcPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(
                Icons.notifications_active_outlined), // Notification icon
            onPressed: () {
              // Handle notification press
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: [
          _buildDashboardContent(context, viewModel), // Dashboard content
          BookingsView(), // RecordView class
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: (index) {
          viewModel.onTabChange(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Bookings',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardContent(
      BuildContext context, DashboardViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Image.asset(
            'assets/images/logo.png',
            height: 120,
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showQRCodeScanner(context, viewModel);
                  },
                  child: buildVerificationContainer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showQRCodeScanner(
      BuildContext context, DashboardViewModel viewModel) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Scan QR Code',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Place your QR code, in front of your camera to scan your verification code',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: QRView(
                    key: viewModel.qrKey,
                    onQRViewCreated: viewModel.onQRViewCreated,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).then((_) async {
      if(viewModel.response != null) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SuccessPage(bookingData: viewModel.response!.data!),
              ),
            );
          },
        );
      }
    });
  }

  Widget buildVerificationContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: kcPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.qr_code_scanner, color: kcPrimaryColor),
                const SizedBox(width: 8),
                Text(
                  "Click to scan",
                  style: TextStyle(
                    fontSize: 16,
                    color: kcSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) {
    return DashboardViewModel();
  }
}
