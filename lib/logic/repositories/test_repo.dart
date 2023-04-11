import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/models/package_model.dart';
import '/models/test_model.dart';

class TestRepo extends GetxController {
  static TestRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<TestModel>> allTests() async {
    final snapshot = await _db.collection("Tests").get();
    final testList = snapshot.docs.map((doc) => TestModel.fromSnapshot(doc)).toList();
    testList.sort((a, b) => a.order < b.order ? -1 : 1);
    return testList;
  }

  Future<List<PackageModel>> allPackages() async {
    final snap = _db.collection("Packages");
    final snapshot = await snap.get();
    final packageList = snapshot.docs.map((doc) => PackageModel.fromSnapshot(doc)).toList();

    for (var i = 0; i < packageList.length; i++) {
      final testSnapshot = await snap.doc(packageList[i].id).collection("PackageTests").get();

      final packageTestList = testSnapshot.docs.map((doc) => PackageTest.fromSnapshot(doc)).toList();

      packageTestList.sort((a, b) => a.order < b.order ? -1 : 1);
      packageList[i].listOfTests = packageTestList;
    }

    packageList.sort((a, b) => a.order < b.order ? -1 : 1);
    return packageList;
  }

  Future<void> addTest(TestModel test) async {
    DateFormat dateFormat2 = DateFormat("ssmmHHddMMyyyy");
    String dtKey = dateFormat2.format(DateTime.now());

    await _db.collection("Tests").doc("t$dtKey").set(test.toJson());
  }

  Future<void> updateTest(TestModel test) async {
    await _db.collection("Tests").doc(test.id).update(test.toJson());
  }

  Future<void> deleteTest(TestModel test) async {
    await _db.collection("Tests").doc(test.id).delete();
  }

  Future<void> addPackage(PackageModel package, List<PackageTest> packageTests) async {
    DateFormat dateFormat2 = DateFormat("ssmmHHddMMyyyy");
    String dtKey = dateFormat2.format(DateTime.now());

    await _db.collection("Packages").doc(dtKey).set(package.toJson());

    for (int i = 0; i < packageTests.length; i++) {
      String testKey = "${i + 1}$dtKey";
      await _db.collection("Packages").doc(dtKey).collection("PackageTests").doc(testKey).set(packageTests[i].toJson());
    }
  }

  Future<void> updatePackage(PackageModel package, List<PackageTest> packageTests) async {
    await _db.collection("Packages").doc(package.id).update(package.toJson());

    for (int i = 0; i < packageTests.length; i++) {
      String testKey = "${i + 1}${package.id}";
      await _db.collection("Packages").doc(package.id).collection("PackageTests").doc(testKey).set(packageTests[i].toJson());
    }
  }

  Future<void> deletePackage(PackageModel package) async {
    await _db.collection("Packages").doc(package.id).delete();
  }
}
