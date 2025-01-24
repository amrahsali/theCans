import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({super.key});



  @override
  State<BookingsView> createState() => _RecordViewState();
}



class _RecordViewState extends State<BookingsView> {

  @override
  void initState() {
    super.initState();
    //model.getBookings();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text('Bookings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('name'),
                  subtitle: Text('Booking type'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}