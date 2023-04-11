import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/home/components/grid_menu.dart';
import 'package:sb_admin/screens/tests/subcreens/add_test_screen.dart';
import 'package:sb_admin/screens/tests/subcreens/view_test_screen.dart';

import '/constants.dart';
import '../home/components/home_tile.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Tests"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue[600],
            onTap: () => Get.to(() => const ViewTestScreen()),
          ),
          HomeTile(
            label: "Add",
            color: Colors.green[600],
            onTap: () => Get.to(() => const AddTestScreen()),
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple[600],
            onTap: () => Get.to(() => const ViewTestScreen(isEditChoose: true)),
          ),
          HomeTile(
            label: "Delete",
            color: Colors.red[600],
            onTap: () => Get.to(() => const ViewTestScreen(isDeleteChoose: true)),
          ),
        ],
      ),
    );
  }
}
