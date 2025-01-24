import 'dart:convert';

class UserResponse {
  final bool status;
  final UserData? data;
  final String token;
  final String msg;

  UserResponse({
    required this.status,
    this.data,
    required this.token,
    required this.msg,
  });

  // Factory method to create a UserResponse object from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      token: json['token'] ?? '',
      msg: json['msg'] ?? '',
    );
  }

  // Method to convert a UserResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'token': token,
      'msg': msg,
    };
  }
}

class UserData {
  final int id;
  final String name;
  final String image;
  final String? phone;
  final String email;
  final String role;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.image,
    this.phone,
    required this.email,
    required this.role,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a UserData object from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      phone: json['phone'],
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  // Method to convert a UserData object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'phone': phone,
      'email': email,
      'role': role,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
