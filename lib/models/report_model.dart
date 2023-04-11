import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? id;
  final String reference;
  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String downloadUrl;
  final String date;
  final String testName;

  ReportModel({
    this.id,
    required this.reference,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.downloadUrl,
    required this.date,
    required this.testName,
  });

  toJson() {
    return {
      "Reference": reference,
      "UserId": userId,
      "FirstName": firstName,
      "LastName": lastName,
      "PhoneNo": phoneNo,
      "DownloadUrl": downloadUrl,
      "Date": date,
      "TestName": testName,
    };
  }

  factory ReportModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReportModel(
      id: document.id,
      reference: data["Reference"],
      userId: data["UserId"],
      firstName: data["FirstName"],
      lastName: data["LastName"],
      phoneNo: data["PhoneNo"],
      downloadUrl: data["DownloadUrl"],
      date: data["Date"],
      testName: data["TestName"],
    );
  }
}
