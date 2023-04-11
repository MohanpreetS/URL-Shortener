import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/orders/subscreens/add_order_screen.dart';
import 'package:sb_admin/screens/orders/subscreens/view_order_screen.dart';

import '../home/components/grid_menu.dart';
import '../home/components/home_tile.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Orders"),
      ),
      body: Grid4Menu(
        children: [
          HomeTile(
            label: "View",
            color: Colors.blue[600],
            onTap: () => Get.to(() => ViewOrderScreen()),
          ),
          HomeTile(
            label: "Add",
            color: Colors.green[600],
            onTap: () => Get.to(() => AddOrderScreen()),
          ),
          HomeTile(
            label: "Update",
            color: Colors.orange,
            onTap: () {},
          ),
          HomeTile(
            label: "Edit",
            color: Colors.purple[600],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
