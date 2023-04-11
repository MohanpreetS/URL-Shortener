import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/user_controller.dart';
import 'package:sb_admin/logic/repositories/auth_repo.dart';
import 'package:sb_admin/logic/repositories/report_repo.dart';
import 'package:sb_admin/screens/home/components/grid_menu.dart';
import 'package:sb_admin/screens/orders/subscreens/view_order_screen.dart';
import 'package:sb_admin/screens/reports/subscreens/add_report_screen.dart';
import 'package:sb_admin/screens/reports/subscreens/add_report_screen2.dart';
import 'package:sb_admin/screens/reports/subscreens/view_report_screen.dart';

import '/constants.dart';
import '../home/components/home_tile.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({Key? key}) : super(key: key);

  final uController = Get.put(UserController());
  final aController = Get.put(AuthRepo());
  final rController = Get.put(ReportRepo());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //String? userId = aController.firebaseUser.value!.phoneNumber ?? aController.firebaseUser.value!.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Reports"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue[600],
            onTap: () => Get.to(() => const ViewReportScreen()),
          ),
          HomeTile(
            label: "Add",
            color: Colors.green[600],
            onTap: () => Get.to(() => const ViewOrderScreen(isReportUpload: true)),
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple[600],
            onTap: () => Get.to(() => const ViewReportScreen(
                  isEditChoose: true,
                )),
          ),
          HomeTile(
            label: "Delete",
            color: Colors.red[600],
            onTap: () => Get.to(() => const ViewReportScreen(
                  isDeleteChoose: true,
                )),
          ),
        ],
      ),
    );
  }
}
