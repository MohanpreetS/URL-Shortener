import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/tests/subcreens/search_test_screen.dart';

import '../../packages/components/custom_button.dart';
import '/logic/controllers/test_controller.dart';
import '/screens/tests/components/test_card.dart';
import '/constants.dart';
import 'delete_test_screen.dart';
import 'edit_test_screen.dart';

class ViewTestScreen extends StatefulWidget {
  const ViewTestScreen({Key? key, this.isEditChoose = false, this.isDeleteChoose = false}) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;

  @override
  State<ViewTestScreen> createState() => _ViewTestScreenState();
}

class _ViewTestScreenState extends State<ViewTestScreen> {
  final tController = Get.put(TestController());

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditChoose
            ? "Edit Tests"
            : widget.isDeleteChoose
                ? "Delete Tests"
                : "View Tests"),
      ),
      body: FutureBuilder(
        future: tController.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              TestsAndPackages testsAndPackages = snapshot.data as TestsAndPackages;
              //final listOfPackages = testsAndPackages.listOfPackages;
              final listOfTests = testsAndPackages.listOfTests;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: medPadding),
                    child: CustomButton(
                      label: "Search",
                      color: Colors.blue,
                      onTap: () => Get.to(
                        () => SearchTestScreen(
                          listOfTests: listOfTests,
                          isDeleteChoose: widget.isDeleteChoose,
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
                              listOfTests.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  if (widget.isEditChoose) {
                                    Get.to(() => EditTestScreen(test: listOfTests[index]));
                                  }
                                  if (widget.isDeleteChoose) {
                                    Get.to(() => DeleteTestScreen(test: listOfTests[index]));
                                  }
                                },
                                child: TestCard(
                                  test: listOfTests[index],
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
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const Center(
                  child: CircularProgressIndicator(color: darkPurple),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
