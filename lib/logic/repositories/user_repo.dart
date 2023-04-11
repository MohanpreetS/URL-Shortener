import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  late UserModel user;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      () => Get.snackbar("Success", "You account has been created.",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green.withOpacity(0.1), colorText: Colors.green);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent.withOpacity(0.1), colorText: Colors.red);
      //print(error.toString());
      throw error;
    });
  }

  Future<bool> userExists(String phoneNo) async {
    return await _db.collection("Users").where("PhoneNo", isEqualTo: phoneNo).get().then((value) => value.size > 0 ? true : false);
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userList = snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    return userList;
  }

  Future<UserModel> getUserDetails(String phoneNo) async {
    final snapshot = await _db.collection("Users").where("PhoneNo", isEqualTo: phoneNo).get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
