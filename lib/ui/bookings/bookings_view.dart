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

// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
//
// import 'bookingsViewModel.dart';
//
// class BookingsView extends StatelessWidget {
//   const BookingsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<BookingViewModel>.reactive(
//       viewModelBuilder: () => BookingViewModel(),
//       onViewModelReady: (model) => model.getBookings(), // Fetch bookings when the view is ready
//       builder: (context, model, child) {
//         if (model.isBusy) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         if (model.data.bookings.isEmpty) {
//           return const Center(
//             child: Text('No bookings available.'),
//           );
//         }
//
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Bookings'),
//           ),
//           body: ListView.builder(
//             itemCount: model.data.bookings.length,
//             itemBuilder: (context, index) {
//               final booking = model.data.bookings[index];
//               return ListTile(
//                 title: Text(booking.name), // Assuming `name` is a field in the booking data
//                 subtitle: Text(booking.type), // Assuming `type` is a field in the booking data
//                 trailing: Text(booking.date), // Display other booking info if needed
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
