import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/screens/orders/components/order_card.dart';
import 'package:file_picker/file_picker.dart';

import '../../../models/order_model.dart';
import '/logic/repositories/report_repo.dart';
import '/logic/controllers/user_controller.dart';
import '/models/user_model.dart';
import 'search_report_test_screen.dart';
import '../../packages/components/custom_button.dart';
import '../../users/components/user_card.dart';
import '/constants.dart';

class AddReportScreen2 extends StatefulWidget {
  const AddReportScreen2({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  State<AddReportScreen2> createState() => _AddReportScreen2State();
}

class _AddReportScreen2State extends State<AddReportScreen2> {
  final uController = Get.put(UserController());
  final rController = Get.put(ReportRepo());
  final tController = Get.put(TestController());

  // bool filePicked = false;
  String fileName = "No File Chosen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Report"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please pick the report file for this order"),
              Text(fileName),
              CustomButton(
                label: "Pick file",
                color: darkPurple,
                onTap: () async {
                  FilePickerResult? filePickerResult = await rController.pickWordFile();
                  setState(
                    () {
                      fileName = filePickerResult!.files.single.name;
                    },
                  );
                },
              ),
              OrderCard(order: widget.order),
            ],
          ),
        ),
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

 