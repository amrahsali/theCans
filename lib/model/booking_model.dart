class AllBookingResponse {
  final bool status;
  final Data? data;

  AllBookingResponse({required this.status, this.data});

  factory AllBookingResponse.fromJson(Map<String, dynamic> json) {
    return AllBookingResponse(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final int currentPage;
  final List<Booking>? bookings;

  Data({required this.currentPage, this.bookings});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      currentPage: json['current_page'],
      bookings: (json['data'] as List?)
          ?.map((booking) => Booking.fromJson(booking))
          .toList(),
    );
  }
}

class Booking {
  final int id;
  final String bId;
  final String bookingType;
  final String startDate;
  final String customerFirstName;
  final String customerLastName;
  final String customerEmail;
  final String customerPhone;
  final String totalPrice;
  final String location;
  final Space? space;

  Booking({
    required this.id,
    required this.bId,
    required this.bookingType,
    required this.startDate,
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerEmail,
    required this.customerPhone,
    required this.totalPrice,
    required this.location,
    this.space,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      bId: json['b_id'],
      bookingType: json['booking_type'],
      startDate: json['start_date'],
      customerFirstName: json['customer_first_name'],
      customerLastName: json['customer_last_name'],
      customerEmail: json['customer_email'],
      customerPhone: json['customer_phone'],
      totalPrice: json['total_price'],
      location: json['location'],
      space: json['space'] != null ? Space.fromJson(json['space']) : null,
    );
  }
}

class Space {
  final int id;
  final String name;
  final String description;
  final String image;

  Space({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
