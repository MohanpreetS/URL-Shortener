import 'package:get/get.dart';
import 'package:sb_admin/logic/repositories/order_repo.dart';
import 'package:sb_admin/models/order_model.dart';

import '../../models/order_item_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final _orderRepo = Get.put(OrderRepo());
  List<OrderModel>? localOrders;
  bool valuesChanged = false;

  Future<List<OrderModel>> fetchOrders() async {
    if (localOrders == null || valuesChanged) {
      localOrders = await getOrders();
      valuesChanged = false;
      return Future.delayed(Duration.zero, () => localOrders!);
    }
    return localOrders!;
  }

  Future<void> addOrder(OrderModel order, List<OrderItemModel> listOfItems) async {
    await _orderRepo.addOrder(order, listOfItems);
  }

  Future<List<OrderModel>> getOrders() async {
    return await _orderRepo.allOrders();
  }
}
