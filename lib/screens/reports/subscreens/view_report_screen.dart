import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/repositories/report_repo.dart';
import 'package:sb_admin/models/report_model.dart';
import 'package:sb_admin/screens/packages/components/custom_button.dart';
import 'package:sb_admin/screens/reports/subscreens/search_report_screen.dart';

import '../components/report_card.dart';
import '/logic/controllers/test_controller.dart';
import '/constants.dart';
import 'delete_report_screen.dart';
import 'edit_report_screen.dart';

class ViewReportScreen extends StatefulWidget {
  const ViewReportScreen({Key? key, this.isEditChoose = false, this.isDeleteChoose = false}) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;

  @override
  State<ViewReportScreen> createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
  final tController = Get.put(TestController());
  final rController = Get.put(ReportRepo());

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
            ? "Edit Reports"
            : widget.isDeleteChoose
                ? "Delete Reports"
                : "View Reports"),
      ),
      body: FutureBuilder(
        future: rController.fetchReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<ReportModel> listOfReports = snapshot.data as List<ReportModel>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: medPadding),
                    child: CustomButton(
                      label: "Search",
                      color: Colors.blue,
                      onTap: () {
                        Get.to(
                          () => SearchReportScreen(
                            listOfReports: listOfReports,
                            isDeleteChoose: widget.isDeleteChoose,
                            isEditChoose: widget.isEditChoose,
                          ),
                        );
                      },
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
                              listOfReports.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  if (widget.isEditChoose) {
                                    Get.to(() => EditReportScreen(report: listOfReports[index]));
                                  }
                                  if (widget.isDeleteChoose) {
                                    Get.to(() => DeleteReportScreen(report: listOfReports[index]));
                                  }
                                },
                                child: ReportCard(
                                  report: listOfReports[index],
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
