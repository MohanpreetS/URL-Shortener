import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../models/report_model.dart';
import '../../packages/components/custom_button.dart';
import '../../packages/components/label_text.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.report,
  });

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: medPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: medPadding,
      ),
      //height: 300,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                report.testName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "First Name: ",
              text: report.firstName,
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Last Name: ",
              text: report.lastName,
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Phone No: ",
              text: report.phoneNo,
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Date",
              text: report.date,
              isCenter: true,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: smallPadding),
          //   child: CustomButton(label: "View", color: darkPurple, onTap: () {}),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: CustomButton(
              label: "Download",
              color: darkBlue,
              onTap: () async {
                var url = Uri.parse(report.downloadUrl);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
