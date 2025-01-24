import 'dart:convert';

class BookingResponse {
  final bool status;
  final BookingData? data;
  final String msg;

  BookingResponse({
    required this.status,
    this.data,
    required this.msg,
  });

  // Factory method to create a BookingResponse object from JSON
  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'] ?? false,
      data: json['data'] != null ? BookingData.fromJson(json['data']) : null,
      msg: json['msg'] ?? '',
    );
  }

  // Method to convert a BookingResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'msg': msg,
    };
  }
}

class BookingData {
  final int id;
  final int spaceId;
  final String bId;
  final String bookingType;
  final String startDate;
  final String customerFirstName;
  final String customerLastName;
  final String customerEmail;
  final String customerPhone;
  final String? startTime;
  final String? endTime;
  final String totalPrice;
  final String isConfirmed;
  final String location;
  final String createdAt;
  final String updatedAt;
  final Space? space;
  final List<dynamic> payments;

  BookingData({
    required this.id,
    required this.spaceId,
    required this.bId,
    required this.bookingType,
    required this.startDate,
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerEmail,
    required this.customerPhone,
    this.startTime,
    this.endTime,
    required this.totalPrice,
    required this.isConfirmed,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    this.space,
    required this.payments,
  });

  // Factory method to create a BookingData object from JSON
  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      id: json['id'] ?? 0,
      spaceId: json['space_id'] ?? 0,
      bId: json['b_id'] ?? '',
      bookingType: json['booking_type'] ?? '',
      startDate: json['start_date'] ?? '',
      customerFirstName: json['customer_first_name'] ?? '',
      customerLastName: json['customer_last_name'] ?? '',
      customerEmail: json['customer_email'] ?? '',
      customerPhone: json['customer_phone'] ?? '',
      startTime: json['start_time'],
      endTime: json['end_time'],
      totalPrice: json['total_price'] ?? '',
      isConfirmed: json['is_confirmed'] ?? '',
      location: json['location'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      space: json['space'] != null ? Space.fromJson(json['space']) : null,
      payments: json['payments'] ?? [],
    );
  }

  // Method to convert a BookingData object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'space_id': spaceId,
      'b_id': bId,
      'booking_type': bookingType,
      'start_date': startDate,
      'customer_first_name': customerFirstName,
      'customer_last_name': customerLastName,
      'customer_email': customerEmail,
      'customer_phone': customerPhone,
      'start_time': startTime,
      'end_time': endTime,
      'total_price': totalPrice,
      'is_confirmed': isConfirmed,
      'location': location,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'space': space?.toJson(),
      'payments': payments,
    };
  }
}

class AllBookingResponse{
  final List<BookingData> data;
  final int total;
  final int perPage;
  final int currentPage;
  AllBookingResponse({
    required this.data,
    required this.total,
    required this.perPage,
    required this.currentPage,
  });

  factory AllBookingResponse.fromJson(Map<String, dynamic> json) {
    return AllBookingResponse(
      data: List<BookingData>.from(json['data'].map((x) => BookingData.fromJson(x))),
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
      currentPage: json['current_page'] ?? 0);

}}

class Space {
  final int id;
  final String name;
  final String image;
  final String description;
  final String benefit;
  final String noOfPersons;
  final String priceHalfDay;
  final String priceDaily;
  final String priceWeekly;
  final String priceMonthly;
  final String priceAnnually;
  final int minNoOfDays;
  final int maxNoOfDays;
  final int isAvailable;
  final int isActive;
  final String location;
  final String createdAt;
  final String updatedAt;

  Space({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.benefit,
    required this.noOfPersons,
    required this.priceHalfDay,
    required this.priceDaily,
    required this.priceWeekly,
    required this.priceMonthly,
    required this.priceAnnually,
    required this.minNoOfDays,
    required this.maxNoOfDays,
    required this.isAvailable,
    required this.isActive,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a Space object from JSON
  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      benefit: json['benefit'] ?? '',
      noOfPersons: json['no_of_persons'] ?? '',
      priceHalfDay: json['price_half_day'] ?? '',
      priceDaily: json['price_daily'] ?? '',
      priceWeekly: json['price_weekly'] ?? '',
      priceMonthly: json['price_monthly'] ?? '',
      priceAnnually: json['price_annually'] ?? '',
      minNoOfDays: json['min_no_of_days'] ?? 0,
      maxNoOfDays: json['max_no_of_days'] ?? 0,
      isAvailable: json['isAvailable'] ?? 0,
      isActive: json['isActive'] ?? 0,
      location: json['location'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  // Method to convert a Space object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'benefit': benefit,
      'no_of_persons': noOfPersons,
      'price_half_day': priceHalfDay,
      'price_daily': priceDaily,
      'price_weekly': priceWeekly,
      'price_monthly': priceMonthly,
      'price_annually': priceAnnually,
      'min_no_of_days': minNoOfDays,
      'max_no_of_days': maxNoOfDays,
      'isAvailable': isAvailable,
      'isActive': isActive,
      'location': location,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
