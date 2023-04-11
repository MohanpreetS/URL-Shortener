import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/logic/controllers/user_controller.dart';
import 'package:sb_admin/screens/users/subscreens/view_user_screen.dart';

import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import '/constants.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key, this.isAddScreen = false}) : super(key: key);

  final bool isAddScreen;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final tController = Get.put(TestController());

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  final uController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Package"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Form(
                key: _formKey1,
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(vertical: medPadding, horizontal: medPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NumField(
                        label: "Phone Number",
                        controller: _phoneNoController,
                        isPhoneNum: true,
                        width: 200,
                        maxLen: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: medPadding),
                          child: CustomButton(
                            label: "Get OTP",
                            color: darkPurple,
                            onTap: () async {
                              if (_formKey1.currentState!.validate()) {
                                //TODO: make this +91
                                final String phoneNum = "+1${_phoneNoController.text}";
                                uController.phoneAuthentication(phoneNum);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey2,
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(horizontal: medPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NumField(
                        label: "OTP",
                        controller: _otpController,
                        isOtp: true,
                        width: 120,
                        maxLen: 6,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: medPadding),
                          child: CustomButton(
                            label: "Submit OTP",
                            color: pinkPurple,
                            onTap: () async {
                              if (_formKey1.currentState!.validate()) {
                                final String otp = _otpController.text.trim();
                                bool isVerified = await uController.verifyOtp(otp);
                                if (isVerified) {
                                  Get.snackbar("Success", "OTP succesfully verified");
                                } else {
                                  Get.snackbar("Error", "OTP verification failed");
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.isAddScreen)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: medPadding),
                    child: CustomButton(
                      label: "Next Step",
                      color: Colors.green[600]!,
                      onTap: () {
                        Get.to(
                          () => const ViewUserScreen(
                            isEditChoose: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
