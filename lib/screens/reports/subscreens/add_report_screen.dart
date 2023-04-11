import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/screens/orders/components/package_test_switch.dart';
import 'package:sb_admin/screens/reports/subscreens/search_report_package_screen.dart';
import 'package:sb_admin/screens/users/subscreens/search_user_screen.dart';

import '/logic/repositories/report_repo.dart';
import '/logic/controllers/user_controller.dart';
import '/models/user_model.dart';
import 'search_report_test_screen.dart';
import '../../packages/components/custom_button.dart';
import '../../users/components/user_card.dart';
import '/constants.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final uController = Get.put(UserController());
  final rController = Get.put(ReportRepo());
  final tController = Get.put(TestController());

  bool _isPackage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Report"),
      ),
      body: FutureBuilder(
        future: uController.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<UserModel> listOfUsers = snapshot.data as List<UserModel>;
              return Column(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: medPadding,
                          vertical: smallPadding,
                        ),
                        child: Text(
                          "Is the report for a test or package?",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      PackageTestSwitch(
                        isPackage: _isPackage,
                        onChanged: () => setState(() {
                          _isPackage = !_isPackage;
                        }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: medPadding),
                    child: CustomButton(
                      label: "Search",
                      color: Colors.blue,
                      onTap: () => Get.to(
                        () => SearchUserScreen(
                          listOfUsers: listOfUsers,
                          isReportChoose: true,
                          isPackage: _isPackage,
                        ),
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
                              listOfUsers.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  // rController.pickAndUploadPdf(listOfUsers[index]);
                                  if (!_isPackage) {
                                    Get.to(
                                      () => SearchReportTestScreen(
                                        listOfTests: tController.testsAndPackages!.listOfTests,
                                        user: listOfUsers[index],
                                      ),
                                    );
                                  } else {
                                    Get.to(
                                      () => SearchReportPackageScreen(
                                        listOfPackages: tController.testsAndPackages!.listOfPackages,
                                        user: listOfUsers[index],
                                      ),
                                    );
                                  }
                                },
                                child: UserCard(
                                  user: listOfUsers[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Center(
                    child: Text(snapshot.error.toString()),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(color: darkPurple),
            );
          }
        },
      ),
    );
  }
}

// const Center(
//         child: UserCard(
//           fName: "FirstName",
//           lName: "Lastname",
//           phoneNo: "+91 1234567890",
//           gender: "Male",
//           dob: "04/07/1997",
//         ),
//       ),

 