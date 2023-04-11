import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/user_controller.dart';
import 'package:sb_admin/models/user_model.dart';
import 'package:sb_admin/screens/users/subscreens/edit_user_screen.dart';
import 'package:sb_admin/screens/users/subscreens/search_user_screen.dart';

import '../../packages/components/custom_button.dart';
import '../components/user_card.dart';
import '/constants.dart';

class ViewUserScreen extends StatefulWidget {
  const ViewUserScreen({Key? key, this.isEditChoose = false}) : super(key: key);

  final bool isEditChoose;
  //final bool isDeleteChoose;

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
  final uController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditChoose ? "Edit Users" : "View Users"),
      ),
      body: FutureBuilder(
        future: uController.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //TestsAndPackages testsAndPackages = snapshot.data as TestsAndPackages;
              List<UserModel> listOfUsers = snapshot.data as List<UserModel>;
              //final listOfPackages = testsAndPackages.listOfPackages;
              //final listOfTests = testsAndPackages.listOfTests;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: medPadding),
                    child: CustomButton(
                      label: "Search",
                      color: Colors.blue,
                      onTap: () => Get.to(
                        () => SearchUserScreen(
                          listOfUsers: listOfUsers,
                          isEditChoose: widget.isEditChoose,
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
                                  if (widget.isEditChoose) {
                                    Get.to(() => EditUserScreen(user: listOfUsers[index]));
                                  }
                                  // if (widget.isDeleteChoose) {
                                  //   Get.to(() => DeleteTestScreen(test: listOfTests[index]));
                                  // }
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

 