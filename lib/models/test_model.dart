import 'package:cloud_firestore/cloud_firestore.dart';

class TestModel {
  final String? id;
  final String title, details;
  final String price;
  final double order;

  TestModel({
    this.id,
    required this.title,
    required this.details,
    required this.price,
    required this.order,
  });

  toJson() {
    return {
      "Title": title,
      "Price": price,
      "Order": order.toString(),
      "Details": details,
    };
  }

  factory TestModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TestModel(
      id: document.id,
      title: data["Title"],
      details: data["Details"],
      price: data["Price"],
      order: double.parse(data["Order"]),
    );
  }
}

// List<TestModel> listOfTests = [
//   TestModel(
//     title: "Mutlislice CT Scan",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan2",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan3",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan4",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan5",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan6",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan7",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
//   TestModel(
//     title: "Mutlislice CT Scan8",
//     details:
//         "Seimens go now 32 slice low dose ct scan machine equipped with latest software and pressure injector of cure healthcare with 1st installation in UP. Capable of doing all types of angiography, and scanning of whole body.",
//     price: "899",
//   ),
// ];
