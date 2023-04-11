import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/home/components/grid_menu.dart';
import 'package:sb_admin/screens/users/subscreens/otp_verify_screen.dart';
import 'package:sb_admin/screens/users/subscreens/view_user_screen.dart';

import '/constants.dart';
import '../home/components/home_tile.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Users"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue[600],
            onTap: () => Get.to(() => const ViewUserScreen()),
          ),
          HomeTile(
            label: "Add",
            color: Colors.green[600],
            onTap: () => Get.to(() => const VerifyOtpScreen(isAddScreen: true)),
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple[600],
            onTap: () => Get.to(() => const ViewUserScreen(isEditChoose: true)),
          ),
          HomeTile(
            label: "Verify",
            color: Colors.orange,
            onTap: () => Get.to(() => const VerifyOtpScreen()),
          ),
        ],
      ),
    );
  }
}
