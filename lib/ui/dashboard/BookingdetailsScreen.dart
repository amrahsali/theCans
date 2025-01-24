import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  const BookingDetailsScreen({Key? key, required this.bookingData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = bookingData['space'];

    return Scaffold(
      appBar: AppBar(title: Text('Booking Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Booking ID: ${bookingData['b_id']}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Customer: ${bookingData['customer_first_name']} ${bookingData['customer_last_name']}'),
            Text('Email: ${bookingData['customer_email']}'),
            Text('Phone: ${bookingData['customer_phone']}'),
            SizedBox(height: 10),
            Text('Booking Type: ${bookingData['booking_type']}'),
            Text('Start Date: ${bookingData['start_date']}'),
            Text('Total Price: \$${bookingData['total_price']}'),
            SizedBox(height: 10),
            Text('Space Details:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${space['name']}'),
            Text('Location: ${space['location']}'),
            Text('Description: ${space['description']}'),
          ],
        ),
      ),
    );
  }
}