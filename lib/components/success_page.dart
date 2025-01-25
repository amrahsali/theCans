import 'package:flutter/material.dart';
import 'package:scan/model/verify_model.dart';
import '../common/app_colors.dart';

class SuccessPage extends StatefulWidget {
  final BookingData bookingData;

  const SuccessPage({
    required this.bookingData,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Minimize size for dialog
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.bookingData.customerFirstName,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kcSecondaryColor),
        ),
        SizedBox(height: 8),
        Text(
          widget.bookingData.customerPhone,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.bookingData.customerEmail,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.bookingData.space?.name ?? '',
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        SizedBox(height: 8),
    Text(
    (switch (widget.bookingData.isConfirmed) {
    (0) => 'Not Confirmed',
    (1) => 'Confirmed',
    (2) => 'Checked In',
    (3) => 'Checked Out',
    _ => 'Not Confirmed',
    }),
      style:  TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
      ],
    );
  }
}



// enum Confirmation {
//   confirmed(0, 'Confirmed'),
//   notConfirmed(1, 'Not Confirmed'),
//   checkedIn(2, 'Checked In'),
//   checkedOut(3, 'Checked Out');
//
//   final int status;
//   final String label;
//
//   const Confirmation(this.status, this.label);
// }