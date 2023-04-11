import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/user_controller.dart';
import 'package:sb_admin/logic/repositories/auth_repo.dart';
import 'package:sb_admin/logic/repositories/report_repo.dart';
import 'package:sb_admin/screens/home/components/grid_menu.dart';

import '/constants.dart';
import '../home/components/home_tile.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final uController = Get.put(UserController());
  final aController = Get.put(AuthRepo());
  final rController = Get.put(ReportRepo());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? userId = aController.firebaseUser.value!.phoneNumber ?? aController.firebaseUser.value!.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "Logout",
            color: Colors.blue[600],
            onTap: () {
              uController.logout();
            },
          ),
          HomeTile(
            label: "-",
            color: Colors.green[600],
            onTap: () {},
          ),
          HomeTile(
            label: "-",
            color: Colors.purple[600],
            onTap: () async {
              //rController.pickAndUploadPdf();
            },
          ),
          HomeTile(
            label: "-",
            color: Colors.red[600],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
