import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/models/package_model.dart';
import 'package:sb_admin/screens/packages/components/custom_button.dart';
import 'package:sb_admin/screens/packages/components/package_card.dart';
import 'package:sb_admin/screens/packages/subscreens/view_pack_screen.dart';

import '/constants.dart';

class DeletePackScreen extends StatelessWidget {
  const DeletePackScreen({Key? key, required this.package}) : super(key: key);

  final PackageModel package;

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
              PackageCard(package: package),
              Padding(
                padding: const EdgeInsets.only(top: medPadding),
                child: CustomButton(
                    label: "Delete",
                    color: Colors.red,
                    onTap: () async {
                      await tController.deletePackage(package);
                      tController.valuesChanged = true;
                      await tController.fetchData();
                      Get.back();
                      Get.back();
                      Get.to(() => const ViewPackScreen());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
