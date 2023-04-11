import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel {
  final String? id;
  final String title, svgLocation;
  final String retailPrice, discountPrice;
  final double order;
  List<PackageTest>? listOfTests;

  PackageModel({
    this.id,
    required this.title,
    required this.svgLocation,
    required this.retailPrice,
    required this.discountPrice,
    required this.order,
    this.listOfTests,
  });

  toJson() {
    List<String> svgLabels = ["Stethoscope", "Injection", "Microscope", "Flask", "Symbol"];

    String logoAssigner(String value) {
      if (value == "assets/stethoscope.svg") {
        return svgLabels[0];
      } else if (value == "assets/injection_purple.svg") {
        return svgLabels[1];
      } else if (value == "assets/microscope_purple.svg") {
        return svgLabels[2];
      } else if (value == "assets/flask_purple.svg") {
        return svgLabels[3];
      } else if (value == "assets/symbol_purple.svg") {
        return svgLabels[4];
      } else {
        return svgLabels[0];
      }
    }

    return {
      "Title": title,
      "RetailPrice": retailPrice,
      "DiscountPrice": discountPrice,
      "Order": order.toString(),
      "Logo": logoAssigner(svgLocation),
    };
  }

  factory PackageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    List<String> svgLocations = [
      "assets/stethoscope.svg",
      "assets/injection_purple.svg",
      "assets/microscope_purple.svg",
      "assets/flask_purple.svg",
      "assets/symbol_purple.svg",
    ];

    String logoAssigner(String value) {
      if (value == "Stethoscope") {
        return svgLocations[0];
      } else if (value == "Injection") {
        return svgLocations[1];
      } else if (value == "Microscope") {
        return svgLocations[2];
      } else if (value == "Flask") {
        return svgLocations[3];
      } else if (value == "Symbol") {
        return svgLocations[4];
      } else {
        return svgLocations[0];
      }
    }

    return PackageModel(
      id: document.id,
      title: data["Title"],
      retailPrice: data["RetailPrice"],
      discountPrice: data["DiscountPrice"],
      svgLocation: logoAssigner(data["Logo"]),
      order: double.parse(data["Order"]),
    );
  }
}

class PackageTest {
  final String? id;
  final String tests;
  final double order;

  PackageTest({
    this.id,
    required this.tests,
    required this.order,
  });

  toJson() {
    return {
      "Tests": tests,
      "Order": order.toString(),
    };
  }

  factory PackageTest.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PackageTest(
      id: document.id,
      tests: data["Tests"],
      order: double.parse(data["Order"]),
    );
  }
}

// List<PackageModel> packages = [
//   PackageModel(
//     title: "Primary Health Panel 1",
//     retailPrice: "2400",
//     discountPrice: "999",
//     svgLocation: "assets/stethoscope.svg",
//     order: 1,
//     listOfTests: [
//       PackageTest(tests: "CBC, LFT, TSH", order: 1),
//       PackageTest(tests: "Blood Sugar Random", order: 2),
//       PackageTest(tests: "Lipid Profile", order: 3),
//       PackageTest(tests: "Blood Urea", order: 4),
//       PackageTest(tests: "Serum Creatinine", order: 5),
//       PackageTest(tests: "X-Ray Chest", order: 6),
//     ],
//   ),
//   PackageModel(
//     title: "Primary Health Panel 2",
//     retailPrice: "4000",
//     discountPrice: "1899",
//     svgLocation: "assets/injection_purple.svg",
//     order: 2,
//     listOfTests: [
//       PackageTest(tests: "CBC, LFT, TSH", order: 1),
//       PackageTest(tests: "Blood Sugar Random", order: 2),
//       PackageTest(tests: "Lipid Profile", order: 3),
//       PackageTest(tests: "Blood Urea", order: 4),
//       PackageTest(tests: "Serum Creatinine", order: 5),
//       PackageTest(tests: "X-Ray Chest", order: 6),
//       PackageTest(tests: "X-Ray Chest", order: 7),
//     ],
//   ),
//   PackageModel(
//     title: "Complete Health Panel 1",
//     retailPrice: "6500",
//     discountPrice: "2999",
//     svgLocation: "assets/microscope_purple.svg",
//     order: 2,
//     listOfTests: [
//       PackageTest(tests: "CBC, LFT, TSH", order: 1),
//       PackageTest(tests: "Blood Sugar Random", order: 2),
//       PackageTest(tests: "Lipid Profile", order: 3),
//       PackageTest(tests: "Blood Urea", order: 4),
//       PackageTest(tests: "Serum Creatinine", order: 5),
//       PackageTest(tests: "X-Ray Chest", order: 6),
//       PackageTest(tests: "X-Ray Chest", order: 7),
//       PackageTest(tests: "Serum Creatinine", order: 8),
//       PackageTest(tests: "X-Ray Chest", order: 9),
//       PackageTest(tests: "X-Ray Chest", order: 10),
//     ],
//   )
// ];
