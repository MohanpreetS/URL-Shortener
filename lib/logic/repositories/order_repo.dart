import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sb_admin/models/order_model.dart';

import '../../models/order_item_model.dart';

class OrderRepo extends GetxController {
  static OrderRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> addOrder(OrderModel order, List<OrderItemModel> listOfItems) async {
    DateFormat dateFormat = DateFormat("yyyyMMddHHmmss");
    DateTime dtNow = DateTime.now();
    String dtKey = "Ox${dateFormat.format(dtNow)}";
    String historyDtKey = "H$dtKey";

    await _db.collection("Orders").doc(dtKey).set(order.toJson());

    await _db.collection("Orders").doc(dtKey).collection("History").doc(historyDtKey).set(order.toJson());

    for (int i = 0; i < listOfItems.length; i++) {
      String itemKey = "I${i + 1}$dtKey";
      await _db.collection("Orders").doc(dtKey).collection("OrderItems").doc(itemKey).set(listOfItems[i].toJson());
    }
  }

  Future<List<OrderModel>> allOrders() async {
    final snap = _db.collection("Orders");
    final snapshot = await snap.get();
    final orderList = snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();

    for (var i = 0; i < orderList.length; i++) {
      final itemSnapshot = await snap.doc(orderList[i].id).collection("OrderItems").get();

      final orderItemList = itemSnapshot.docs.map((doc) => OrderItemModel.fromSnapshot(doc)).toList();
      orderList[i].listOfItems = orderItemList;
    }

    orderList.sort((a, b) => int.parse(a.dateTime) > int.parse(b.dateTime) ? -1 : 1);
    return orderList;
  }

  // Future<void> addOrder(OrderModel order, List<OrderItemModel> orderItems) {

  // }
}
