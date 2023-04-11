import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/logic/repositories/auth_repo.dart';
import 'package:sb_admin/models/employee_model.dart';
import 'package:sb_admin/models/test_model.dart';

import '../../../logic/controllers/employee_controller.dart';
import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import '/constants.dart';

class AddEmployeesScreen extends StatefulWidget {
  const AddEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeesScreen> createState() => _AddEmployeesScreenState();
}

class _AddEmployeesScreenState extends State<AddEmployeesScreen> {
  final _aController = Get.put(AuthRepo());
  final _eController = Get.put(EmployeeController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee Account"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(vertical: largePadding, horizontal: largePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextOnlyField(
                        label: "Employee Name",
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const Text("Note:email does not need to be valid, example@somemail.com"),
                      TextOnlyField(
                        label: "Employee Email",
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextOnlyField(
                        label: "Employee Password",
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: largePadding),
                          child: CustomButton(
                            label: "Submit",
                            color: darkPurple,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                EmployeeModel employee = EmployeeModel(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                );

                                await _aController.createUserWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text,
                                );

                                await _eController.createNewEmployee(employee);

                                // tController.valuesChanged = true;
                                // await tController.fetchData();
                                Get.back();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
