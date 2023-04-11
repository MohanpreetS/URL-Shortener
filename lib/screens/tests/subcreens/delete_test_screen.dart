import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/controllers/test_controller.dart';
import '/models/test_model.dart';
import '/screens/packages/components/custom_button.dart';
import '/screens/tests/components/test_card.dart';
import '/constants.dart';
import 'view_test_screen.dart';

class DeleteTestScreen extends StatelessWidget {
  const DeleteTestScreen({Key? key, required this.test}) : super(key: key);

  final TestModel test;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final tController = Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Packages"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              TestCard(test: test),
              Padding(
                padding: const EdgeInsets.only(top: medPadding),
                child: CustomButton(
                  label: "Delete",
                  color: Colors.red,
                  onTap: () async {
                    await tController.deleteTest(test);
                    tController.valuesChanged = true;
                    await tController.fetchData();
                    Get.back();
                    Get.back();
                    Get.to(() => const ViewTestScreen());
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
