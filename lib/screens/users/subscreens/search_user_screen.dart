import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/users/subscreens/edit_user_screen.dart';

import '../../../constants.dart';
import '../../../logic/controllers/test_controller.dart';
import '../../reports/subscreens/search_report_package_screen.dart';
import '../../reports/subscreens/search_report_test_screen.dart';
import '../components/user_card.dart';
import '/models/user_model.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({
    Key? key,
    this.isEditChoose = false,
    required this.listOfUsers,
    this.isReportChoose = false,
    this.isPackage = false,
  }) : super(key: key);

  final bool isEditChoose;
  final bool isReportChoose;
  final bool isPackage;
  final List<UserModel> listOfUsers;

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  List<UserModel> _displayedUsers = [];
  final tController = Get.put(TestController());

  @override
  void initState() {
    super.initState();
    _displayedUsers = widget.listOfUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditChoose
            ? "Search & Edit Users"
            : widget.isReportChoose
                ? "Which user is the report for?"
                : "Search Users"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: medPadding),
            child: SizedBox(
              width: 400,
              child: TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    _displayedUsers = widget.listOfUsers.where((user) {
                      var fName = user.firstName.toLowerCase();
                      var lName = user.lastName.toLowerCase();
                      return fName.contains(text) || lName.contains(text) || user.phoneNo.contains(text);
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
                      _displayedUsers.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (widget.isEditChoose) {
                            //Get.to(() => EditTestScreen(test: listOfTests[index]));
                            Get.to(() => EditUserScreen(user: _displayedUsers[index]));
                          }
                          if (widget.isReportChoose) {
                            if (!widget.isPackage) {
                              Get.to(
                                () => SearchReportTestScreen(
                                  listOfTests: tController.testsAndPackages!.listOfTests,
                                  user: _displayedUsers[index],
                                ),
                              );
                            } else {
                              Get.to(
                                () => SearchReportPackageScreen(
                                  listOfPackages: tController.testsAndPackages!.listOfPackages,
                                  user: _displayedUsers[index],
                                ),
                              );
                            }
                          }
                        },
                        child: UserCard(
                          user: _displayedUsers[index],
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

// Padding(
//                     padding: const EdgeInsets.symmetric(vertical: medPadding),
//                     child: CustomButton(
//                       label: "Search",
//                       color: Colors.blue,
//                       onTap: () => Get.to(
//                         () => SearchUserScreen(listOfUsers: listOfUsers),
//                       ),
//                     ),
//                   ),
