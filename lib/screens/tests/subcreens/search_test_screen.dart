import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/models/test_model.dart';

import '/screens/tests/components/test_card.dart';
import '/constants.dart';
import 'delete_test_screen.dart';
import 'edit_test_screen.dart';

class SearchTestScreen extends StatefulWidget {
  const SearchTestScreen({
    Key? key,
    this.isEditChoose = false,
    this.isDeleteChoose = false,
    required this.listOfTests,
    this.isReportChoose = false,
  }) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;
  final bool isReportChoose;
  final List<TestModel> listOfTests;

  @override
  State<SearchTestScreen> createState() => _SearchTestScreenState();
}

class _SearchTestScreenState extends State<SearchTestScreen> {
  List<TestModel> _displayedTests = [];

  @override
  void initState() {
    super.initState();
    _displayedTests = widget.listOfTests;
  }

  String _title() {
    if (widget.isEditChoose) {
      return "Search & Edit Tests";
    } else if (widget.isDeleteChoose) {
      return "Search & Delete Tests";
    } else if (widget.isReportChoose) {
      return "Which Test is the Report for?";
    } else {
      return "Search Tests";
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
                    _displayedTests = widget.listOfTests.where((test) {
                      var lTitle = test.title.toLowerCase();
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
                      _displayedTests.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (widget.isEditChoose) {
                            Get.to(() => EditTestScreen(test: _displayedTests[index]));
                          }
                          if (widget.isDeleteChoose) {
                            Get.to(() => DeleteTestScreen(test: _displayedTests[index]));
                          }
                        },
                        child: TestCard(
                          test: _displayedTests[index],
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
