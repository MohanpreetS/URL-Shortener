import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  final String? id;
  final String name;
  final String email;

  EmployeeModel({
    this.id,
    required this.name,
    required this.email,
  });

  toJson() {
    return {
      "Name": name,
      "Email": email,
    };
  }

  factory EmployeeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return EmployeeModel(
      id: document.id,
      name: data["Name"],
      email: data["Email"],
    );
  }
}
