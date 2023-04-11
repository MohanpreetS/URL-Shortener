import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/employees/subscreens/add_employees_screen.dart';
import 'package:sb_admin/screens/orders/subscreens/add_order_screen.dart';
import 'package:sb_admin/screens/orders/subscreens/view_order_screen.dart';

import '../home/components/grid_menu.dart';
import '../home/components/home_tile.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Employees"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue,
            onTap: () {},
          ),
          HomeTile(
            label: "Add",
            color: Colors.green,
            onTap: () => Get.to(() => AddEmployeesScreen()),
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple,
            onTap: () {},
          ),
          HomeTile(
            label: "Delete",
            color: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
