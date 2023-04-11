import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sb_admin/logic/controllers/user_controller.dart';

import '../components/all_fields.dart';
import '../components/gender_check_box.dart';
import '../components/user_button.dart';
import '/models/user_model.dart';
import '/constants.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key, required this.user}) : super(key: key);
  // final String? id;
  // final String firstName;
  // final String lastName;
  // final String dob;
  // final String gender;
  // final String phoneNo;

  final UserModel user;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _lastNameNode = FocusNode();
  final FocusNode _dateNode = FocusNode();

  bool isMale = true;
  bool isMaleValueSet = false;
  bool isMaleError = false;
  bool isDateSet = false;
  bool isLastNameSet = false;

  final uController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    isMaleValueSet = widget.user.gender != "";
    isMale = widget.user.gender == "" || widget.user.gender == "Male";
    isLastNameSet = widget.user.lastName != "";
    if (widget.user.dob != "") {
      _dateController.text = widget.user.dob;
    }
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User"),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: medPadding,
                        vertical: smallPadding,
                      ),
                      child: Column(
                        children: [
                          FirstNameField(
                            firstNameNode: _firstNameNode,
                            firstNameController: _firstNameController,
                            initialValue: widget.user.firstName,
                          ),
                          LastNameField(
                            lastNameNode: _lastNameNode,
                            lastNameController: _lastNameController,
                            initialValue: widget.user.lastName,
                          ),
                          DOBField(
                            dateNode: _dateNode,
                            dateController: _dateController,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: widget.user.dob != "" ? DateFormat('dd/MM/yyyy').parse(_dateController.text) : DateTime.now(),
                                firstDate: DateTime(1930),
                                lastDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: pinkPurple,
                                        onPrimary: Colors.white,
                                        onSurface: Colors.blueAccent,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: pinkPurple,
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                                setState(() {
                                  _dateController.text = formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: smallPadding,
                                  bottom: smallPadding,
                                ),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GenderCheckBox(
                                    label: "Male",
                                    isMale: isMale,
                                    isMaleValueSet: isMaleValueSet,
                                    ontap: () {
                                      setState(
                                        () {
                                          isMaleValueSet = true;
                                          isMale = true;
                                        },
                                      );
                                    },
                                  ),
                                  GenderCheckBox(
                                    label: "Female",
                                    isMale: !isMale,
                                    isMaleValueSet: isMaleValueSet,
                                    ontap: () {
                                      setState(
                                        () {
                                          isMaleValueSet = true;
                                          isMale = false;
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                              if (isMaleError)
                                Padding(
                                  padding: const EdgeInsets.only(top: smallPadding),
                                  child: Text(
                                    "Please choose a gender",
                                    style: TextStyle(
                                      color: Colors.red[600],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  UserButton(
                    color: pinkPurple,
                    icon: const Icon(Icons.edit),
                    label: "Edit Details",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (!isMaleValueSet) {
                          setState(() {
                            isMaleError = true;
                          });
                          return;
                        } else {
                          setState(() {
                            isMaleError = false;
                          });
                          String isMaleLabel;
                          if (isMale) {
                            isMaleLabel = "Male";
                          } else {
                            isMaleLabel = "Female";
                          }
                          UserModel userData = UserModel(
                            id: widget.user.id,
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            phoneNo: widget.user.phoneNo,
                            dob: _dateController.text,
                            gender: isMaleLabel,
                          );
                          setState(() {
                            _isLoading = true;
                          });
                          await uController.updateRecord(userData);
                          uController.valuesChanged = true;
                          await uController.fetchUsers();
                          setState(() {
                            _isLoading = false;
                          });
                          Get.back();
                        }
                      }
                    },
                  ),
                  if (_isLoading) const CircularProgressIndicator(color: darkPurple)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
