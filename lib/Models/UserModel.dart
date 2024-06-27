import 'dart:io';

import 'package:flutter/widgets.dart';

class UserModel {
  final String uId;
  final String username;
  final String CancerType;
  final String email;
  final String phone;
  final String? Image;
  final String userDeviceToken;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;
  final String Age;

  UserModel( {
    required this.uId,
   required this.CancerType,
    required this.username,
    required this.email,
    required this.phone,
    required this.userDeviceToken,
    required this.isAdmin,
    required this.isActive,
    required this.createdOn,
    required this.Age,
    required this.Image
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'username': username,
      'email': email,
      'phone': phone,
      'userDeviceToken': userDeviceToken,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
      'Age': Age,
      'Image':Image,
      'CancerType':CancerType
    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      userDeviceToken: json['userDeviceToken'],

      CancerType: json['CancerType'],

      isAdmin: json['isAdmin'],
      isActive: json['isActive'],
      createdOn: json['createdOn'].toString(),
      Age: json['Age'], Image: json['Image'],
    );
  }
}
