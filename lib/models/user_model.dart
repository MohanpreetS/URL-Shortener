import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String dob;
  final String gender;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.dob,
    required this.gender,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "PhoneNo": phoneNo,
      "Dob": dob,
      "Gender": gender,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data["FirstName"],
      lastName: data["LastName"],
      phoneNo: data["PhoneNo"],
      dob: data["Dob"],
      gender: data["Gender"],
    );
  }
}
