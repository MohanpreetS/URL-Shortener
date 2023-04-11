import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/employee_controller.dart';
import '/constants.dart';
import '/logic/controllers/user_controller.dart';
import '/logic/repositories/auth_repo.dart';
import '/screens/packages/components/custom_button.dart';
import '/screens/packages/components/text_fields.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final _sController = Get.put(UserController());
  final _eController = Get.put(EmployeeController());
  final _authRepo = Get.put(AuthRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SB Diagnostics Admin"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              padding: const EdgeInsets.all(medPadding),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextOnlyField(controller: _emailController, label: "Email"),
                    TextOnlyField(controller: _passController, label: "Password", isPass: true),
                    Padding(
                      padding: const EdgeInsets.only(top: medPadding, bottom: smallPadding),
                      child: CustomButton(
                        label: "Sign In",
                        color: Colors.blueAccent,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final employeeEmailList = await _eController.allEmployeeEmails();
                            if (employeeEmailList.contains(_emailController.text)) {
                              // _authRepo.cachedEmail = _emailController.text;
                              // _authRepo.cachedPassword = _passController.text;
                              await _sController.login(_emailController.text, _passController.text);
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please use an employee admin email/password",
                                backgroundColor: Colors.red[200],
                              );
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
