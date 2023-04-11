import 'package:get/get.dart';

import '../repositories/employee_repo.dart';
import '../../models/employee_model.dart';

class EmployeeController extends GetxController {
  static EmployeeController get instance => Get.find();

  final _eRepo = Get.put(EmployeeRepo());

  Future<void> createNewEmployee(EmployeeModel employee) async {
    await _eRepo.createEmployee(employee);
  }

  Future<List<String>> allEmployeeEmails() async {
    return await _eRepo.allEmployeeEmails();
  }
}
