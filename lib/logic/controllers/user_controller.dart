import 'package:get/get.dart';

import '../repositories/auth_repo.dart';
import '../repositories/user_repo.dart';
import '/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  List<UserModel>? users;
  bool valuesChanged = false;
  String? adminEmail;

  final _userRepo = Get.put(UserRepo());
  final _authRepo = Get.put(AuthRepo());

  Future<List<UserModel>> fetchUsers() async {
    if (users == null || valuesChanged) {
      users = await getAllUsers();
      valuesChanged = false;
      return Future.delayed(Duration.zero, () => users!);
    }
    return users!;
  }

  Future<void> phoneAuthentication(String phoneNum) async {
    await AuthRepo.instance.phoneAuth(phoneNum);
  }

  Future<bool> verifyOtp(String otp) async {
    var isVerified = await AuthRepo.instance.verifyOtp(otp);
    return isVerified;
  }

  Future<void> login(String email, String password) async {
    await AuthRepo.instance.loginWithEmailAndPassword(email, password);
    ;
  }

  String currentAdminEmail() {
    return _authRepo.giveAdminEmail() ?? "";
  }

  Future<void> logout() async => await _authRepo.logout();

  Future<List<UserModel>> getAllUsers() async {
    return await _userRepo.allUsers();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
