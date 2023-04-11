import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../responsive.dart';
import '../home/components/grid_menu.dart';
import '/constants.dart';
import '../home/components/home_tile.dart';
import 'subscreens/add_pack_screen.dart';
import 'subscreens/view_pack_screen.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Packages"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue[600],
            onTap: () => Get.to(() => const ViewPackScreen()),
          ),
          HomeTile(
            label: "Add",
            color: Colors.green[600],
            onTap: () => Get.to(() => const AddPackScreen()),
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple[600],
            onTap: () => Get.to(
              () => const ViewPackScreen(
                isEditChoose: true,
              ),
            ),
          ),
          HomeTile(
            label: "Delete",
            color: Colors.red[600],
            onTap: () => Get.to(
              () => const ViewPackScreen(
                isDeleteChoose: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
