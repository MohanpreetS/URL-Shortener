import 'package:firebase_auth/firebase_auth.dart';
import "package:get/get.dart";
import 'package:sb_admin/screens/home/home_screen.dart';
import 'package:sb_admin/screens/home/sign_in_screen.dart';

import 'signup_email_failure.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  late String? cachedEmail;
  late String? cachedPassword;

  // void changeJustLoggedIn(bool val) {
  //   justLoggedIn = val;
  // }

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(
    User? user,
  ) {
    user == null ? Get.offAll(() => SignInScreen()) : Get.offAll(() => const HomeScreen());
  }

  String? giveAdminEmail() {
    return _auth.currentUser!.email!;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomeScreen()) : Get.offAll(() => SignInScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Auth Error", ex.message, duration: const Duration(seconds: 10));
      //print('Firebase auth exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      //Get.snackbar("Error", ex.message);
      Get.snackbar("Auth Error", ex.message, duration: const Duration(seconds: 10));
      throw ex;
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.code);
    } catch (_) {}
  }

  Future<bool> phoneAuth(String phoneNum) async {
    bool verificationSuccessful = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (credential) async {
        verificationSuccessful = true;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else {
          //print(e.code);
          Get.snackbar('Error', e.code);
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
    return verificationSuccessful;
  }

  Future<bool> verifyOtp(String otp) async {
    bool isVerified = false;
    try {
      var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp),
      );
      isVerified = credentials.user != null ? true : false;
    } on FirebaseException catch (e) {
      //final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Error", e.code, duration: const Duration(seconds: 5));
      //print('Firebase auth exception - ${ex.message}');
      return false;
    }
    loginWithEmailAndPassword(cachedEmail!, cachedPassword!);
    return isVerified;
  }

  Future<void> logout() async => await _auth.signOut();
}
