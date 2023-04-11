import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/repositories/report_repo.dart';
import 'package:sb_admin/models/package_model.dart';
import 'package:sb_admin/screens/packages/components/custom_button.dart';
import 'package:sb_admin/screens/packages/components/package_card.dart';

import '../../../models/user_model.dart';
import '../../packages/components/text_fields.dart';
import '/constants.dart';

class SearchReportPackageScreen extends StatefulWidget {
  const SearchReportPackageScreen({
    Key? key,
    required this.listOfPackages,
    required this.user,
  }) : super(key: key);

  final List<PackageModel> listOfPackages;
  final UserModel user;

  @override
  State<SearchReportPackageScreen> createState() => _SearchReportPackageScreenState();
}

class _SearchReportPackageScreenState extends State<SearchReportPackageScreen> {
  List<PackageModel> _displayedPackages = [];
  final rController = Get.put(ReportRepo());
  final _pFirstNameController = TextEditingController();
  final _pLastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayedPackages = widget.listOfPackages;
    _pFirstNameController.text = widget.user.firstName;
    _pLastNameController.text = widget.user.lastName;
  }

  String testName = "Please select a Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Which Test is the Report for?"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            child: TextOnlyField(controller: _pFirstNameController, label: "Patient First Name"),
          ),
          SizedBox(
            width: 400,
            child: TextOnlyField(controller: _pLastNameController, label: "Patient Last Name"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: medPadding),
            child: Text(
              testName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          CustomButton(
            label: "Upload Report",
            color: darkBlue,
            onTap: () async {
              if (testName != "Please select a Report") {
                await rController.pickAndUploadPdf(
                  widget.user,
                  testName,
                  _pFirstNameController.text,
                  _pLastNameController.text,
                );
                rController.valuesChanged = true;
                Get.back();
                Get.back();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: medPadding),
            child: SizedBox(
              width: 400,
              child: TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    _displayedPackages = widget.listOfPackages.where((package) {
                      var lTitle = package.title.toLowerCase();
                      return lTitle.contains(text);
                    }).toList();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      _displayedPackages.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            testName = _displayedPackages[index].title;
                          });
                        },
                        child: PackageCard(
                          package: _displayedPackages[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
