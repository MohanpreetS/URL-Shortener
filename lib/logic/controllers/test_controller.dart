import 'package:get/get.dart';

import '../repositories/test_repo.dart';
import '/models/package_model.dart';
import '/models/test_model.dart';

class TestController extends GetxController {
  static TestController get instance => Get.find();

  final _testRepo = Get.put(TestRepo());
  TestsAndPackages? testsAndPackages;
  bool valuesChanged = false;

  Future<TestsAndPackages> fetchData() async {
    if (testsAndPackages == null || valuesChanged) {
      testsAndPackages = await getTestsAndPackages();
      valuesChanged = false;
      return Future.delayed(Duration.zero, () => testsAndPackages!);
    }
    return testsAndPackages!;
  }

  Future<TestsAndPackages> getTestsAndPackages() async {
    final listOfTests = await getAllTests();
    final listOfPackages = await getAllPackages();
    return TestsAndPackages(listOfTests: listOfTests, listOfPackages: listOfPackages);
  }

  Future<List<TestModel>> getAllTests() async {
    return await _testRepo.allTests();
  }

  Future<List<PackageModel>> getAllPackages() async {
    return await _testRepo.allPackages();
  }

  Future<void> addTest(TestModel test) async {
    await _testRepo.addTest(test);
  }

  Future<void> updateTest(TestModel test) async {
    await _testRepo.updateTest(test);
  }

  Future<void> deleteTest(TestModel test) async {
    await _testRepo.deleteTest(test);
  }

  Future<void> addPackage(PackageModel package, List<PackageTest> packageTests) async {
    await _testRepo.addPackage(package, packageTests);
  }

  Future<void> updatePackage(PackageModel package, List<PackageTest> packageTests) async {
    await _testRepo.updatePackage(package, packageTests);
  }

  Future<void> deletePackage(PackageModel package) async {
    await _testRepo.deletePackage(package);
  }
}

class TestsAndPackages {
  final List<TestModel> listOfTests;
  final List<PackageModel> listOfPackages;

  TestsAndPackages({required this.listOfTests, required this.listOfPackages});

  Future<TestsAndPackages> fetchData() async {
    final testController = Get.put(TestController());
    if (testController.testsAndPackages == null) {
      testController.testsAndPackages = await testController.getTestsAndPackages();
      return Future.delayed(Duration.zero, () => testController.testsAndPackages!);
    }
    return testController.testsAndPackages!;
  }
}
