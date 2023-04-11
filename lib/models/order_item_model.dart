import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemModel {
  final String? id;
  final String testId;
  final String retailPrice;
  final String discountPrice;
  final String testName;
  final String reportId;

  OrderItemModel({
    this.id,
    required this.testId,
    required this.retailPrice,
    required this.discountPrice,
    required this.testName,
    this.reportId = "",
  });

  toJson() {
    return {
      "TestId": testId,
      "RetailPrice": retailPrice,
      "DiscountPrice": discountPrice,
      "TestName": testName,
      "ReportId": reportId,
    };
  }

  factory OrderItemModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return OrderItemModel(
      id: document.id,
      testId: data["TestId"],
      retailPrice: data["RetailPrice"],
      discountPrice: data["DiscountPrice"],
      testName: data["TestName"],
      reportId: data["ReportId"],
    );
  }
}
