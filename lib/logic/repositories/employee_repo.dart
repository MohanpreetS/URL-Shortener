import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/employee_model.dart';

class EmployeeRepo extends GetxController {
  static EmployeeRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createEmployee(EmployeeModel user) async {
    await _db.collection("Employees").add(user.toJson()).whenComplete(() {
      () => Get.snackbar(
            "Success",
            "You account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      //print(error.toString());
      throw error;
    });
  }

  Future<List<String>> allEmployeeEmails() async {
    final userList = await allEmployees();
    List<String> employeeEmails = [];
    for (int i = 0; i < userList.length; i++) {
      employeeEmails.add(userList[i].email);
    }
    return employeeEmails;
  }

  Future<List<EmployeeModel>> allEmployees() async {
    final snapshot = await _db.collection("Employees").get();
    final userList = snapshot.docs.map((doc) => EmployeeModel.fromSnapshot(doc)).toList();
    return userList;
  }
}
