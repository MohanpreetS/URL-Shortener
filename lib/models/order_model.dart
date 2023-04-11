import 'package:sb_admin/models/order_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? id;
  final String dateTime;
  final String employeeId;
  final String customerId;
  final String customerName;
  final String customerPhone;
  final String status;
  List<OrderItemModel>? listOfItems;

  OrderModel({
    this.id,
    required this.employeeId,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.status,
    required this.dateTime,
    this.listOfItems,
  });

  toJson() {
    return {
      "EmployeeId": employeeId,
      "CustomerId": customerId,
      "CustomerName": customerName,
      "CustomerPhone": customerPhone,
      "Status": status,
      "DateTime": dateTime,
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return OrderModel(
        id: document.id,
        employeeId: data["EmployeeId"],
        customerId: data["CustomerId"],
        customerName: data["CustomerName"],
        customerPhone: data["CustomerPhone"],
        status: data["Status"],
        dateTime: data["DateTime"]);
  }
}
