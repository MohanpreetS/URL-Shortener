import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/repositories/report_repo.dart';

import '../components/report_card.dart';
import '/models/report_model.dart';
import '/screens/packages/components/custom_button.dart';
import '/constants.dart';
import 'view_report_screen.dart';

class DeleteReportScreen extends StatelessWidget {
  DeleteReportScreen({Key? key, required this.report}) : super(key: key);

  final ReportModel report;
  final rController = Get.put(ReportRepo());

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Packages"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ReportCard(report: report),
              Padding(
                padding: const EdgeInsets.only(top: medPadding),
                child: CustomButton(
                  label: "Delete",
                  color: Colors.red,
                  onTap: () async {
                    await rController.deleteReport(report);
                    rController.valuesChanged = true;
                    await rController.fetchReports();
                    Get.back();
                    Get.back();
                    Get.to(() => const ViewReportScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
