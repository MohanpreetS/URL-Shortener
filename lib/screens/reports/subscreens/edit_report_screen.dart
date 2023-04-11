import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/logic/repositories/report_repo.dart';
import '/models/report_model.dart';
import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import '../../users/components/all_fields.dart';
import '/constants.dart';

class EditReportScreen extends StatefulWidget {
  const EditReportScreen({Key? key, required this.report}) : super(key: key);

  final ReportModel report;

  @override
  State<EditReportScreen> createState() => _EditReportScreenState();
}

class _EditReportScreenState extends State<EditReportScreen> {
  final rController = Get.put(ReportRepo());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _testNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final FocusNode _dateNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _fNameController.text = widget.report.firstName;
    _lNameController.text = widget.report.lastName;
    _testNameController.text = widget.report.testName;
    _dateController.text = widget.report.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Report"),
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
                        label: "Test/Package Name",
                        controller: _testNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextOnlyField(
                        label: "Patient First Name",
                        controller: _fNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextOnlyField(
                        label: "Patient Last Name",
                        controller: _lNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      DOBField(
                        title: "Test Date",
                        dateNode: _dateNode,
                        dateController: _dateController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: widget.report.date != "" ? DateFormat('dd/MM/yyyy').parse(_dateController.text) : DateTime.now(),
                            firstDate: DateTime(2018),
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
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: largePadding),
                          child: CustomButton(
                            label: "Submit",
                            color: darkPurple,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                ReportModel localReport = ReportModel(
                                  id: widget.report.id,
                                  reference: widget.report.reference,
                                  userId: widget.report.userId,
                                  firstName: _fNameController.text,
                                  lastName: _lNameController.text,
                                  phoneNo: widget.report.phoneNo,
                                  downloadUrl: widget.report.downloadUrl,
                                  date: _dateController.text,
                                  testName: _testNameController.text,
                                );

                                await rController.updateReport(localReport);
                                rController.valuesChanged = true;
                                await rController.fetchReports();
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
