import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/screens/packages/subscreens/delete_pack_screen.dart';
import 'package:sb_admin/screens/packages/subscreens/edit_pack_screen.dart';

import '../components/package_card.dart';
import '/constants.dart';

class ViewPackScreen extends StatefulWidget {
  const ViewPackScreen({Key? key, this.isEditChoose = false, this.isDeleteChoose = false}) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;

  @override
  State<ViewPackScreen> createState() => _ViewPackScreenState();
}

class _ViewPackScreenState extends State<ViewPackScreen> {
  final tController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditChoose
            ? "Edit Packages"
            : widget.isDeleteChoose
                ? "Delete Packages"
                : "View Packages"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              FutureBuilder(
                future: tController.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      TestsAndPackages testsAndPackages = snapshot.data as TestsAndPackages;
                      final listOfPackages = testsAndPackages.listOfPackages;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            listOfPackages.length,
                            (index) => GestureDetector(
                              onTap: () {
                                if (widget.isEditChoose) {
                                  Get.to(() => EditPackScreen(package: listOfPackages[index]));
                                }
                                if (widget.isDeleteChoose) {
                                  Get.to(
                                    () => DeletePackScreen(
                                      package: listOfPackages[index],
                                    ),
                                  );
                                }
                              },
                              child: PackageCard(
                                package: listOfPackages[index],
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
            ],
          ),
        ),
      ),
    );
  }
}
