import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/models/report_model.dart';

import '../components/report_card.dart';
import '/constants.dart';
import 'delete_report_screen.dart';
import 'edit_report_screen.dart';

class SearchReportScreen extends StatefulWidget {
  const SearchReportScreen({
    Key? key,
    this.isEditChoose = false,
    this.isDeleteChoose = false,
    required this.listOfReports,
  }) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;
  final List<ReportModel> listOfReports;

  @override
  State<SearchReportScreen> createState() => _SearchReportScreenState();
}

class _SearchReportScreenState extends State<SearchReportScreen> {
  List<ReportModel> _displayedReports = [];

  @override
  void initState() {
    super.initState();
    _displayedReports = widget.listOfReports;
  }

  String _title() {
    if (widget.isEditChoose) {
      return "Search & Edit Reports";
    } else if (widget.isDeleteChoose) {
      return "Search & Delete Reports";
    } else {
      return "Search Reports";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title()),
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
                    _displayedReports = widget.listOfReports.where((report) {
                      var lTestName = report.testName.toLowerCase();
                      var lFirstName = report.firstName.toLowerCase();
                      var lLastName = report.lastName.toLowerCase();

                      return lTestName.contains(text) ||
                          lFirstName.contains(text) ||
                          lLastName.contains(text) ||
                          report.phoneNo.contains(text) ||
                          report.date.contains(text);
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
                      _displayedReports.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (widget.isEditChoose) {
                            Get.to(() => EditReportScreen(report: _displayedReports[index]));
                          }
                          if (widget.isDeleteChoose) {
                            Get.to(() => DeleteReportScreen(report: _displayedReports[index]));
                          }
                        },
                        child: ReportCard(
                          report: _displayedReports[index],
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
