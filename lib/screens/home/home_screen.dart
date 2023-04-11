import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/repositories/auth_repo.dart';
import 'package:sb_admin/responsive.dart';
import 'package:sb_admin/screens/reports/reports_screen.dart';
import 'package:sb_admin/screens/settings/settings_screen.dart';
import 'package:sb_admin/screens/users/users_screen.dart';

import '../../logic/controllers/user_controller.dart';
import '../employees/employees_screen.dart';
import '../orders/orders_screen.dart';
import '../tests/tests_screen.dart';
import '/constants.dart';
import 'components/grid_menu.dart';
import 'components/home_tile.dart';
import '../packages/packages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("SB Diagnostics Admin Panel"),
      ),
      body: Grid8Menu(
        size: size,
        children: [
          HomeTile(
            label: "Packages",
            color: Colors.blue,
            onTap: () => Get.to(() => const PackagesScreen()),
          ),
          HomeTile(
            label: "Tests",
            color: Colors.green,
            onTap: () => Get.to(() => const TestsScreen()),
          ),
          HomeTile(
            label: "Users",
            color: darkPurple,
            onTap: () => Get.to(() => const UsersScreen()),
          ),
          HomeTile(
            label: "Reports",
            color: Colors.orange,
            onTap: () => Get.to(() => ReportsScreen()),
          ),
          HomeTile(
            label: "Orders",
            color: Colors.pinkAccent,
            onTap: () => Get.to(() => const OrdersScreen()),
          ),
          if (aController.currentAdminEmail() == "dr.sssahni@gmail.com")
            HomeTile(
              label: "Employees",
              color: pinkPurple,
              onTap: () => Get.to(() => EmployeesScreen()),
            ),
          HomeTile(
            label: "Doctors",
            color: Colors.red,
            onTap: () {},
          ),
          HomeTile(
            label: "Settings",
            color: Colors.brown,
            onTap: () => Get.to(() => SettingsScreen()),
          ),
        ],
      ),
    );
  }
}
