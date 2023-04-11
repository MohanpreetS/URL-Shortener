import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/models/order_model.dart';
import 'package:sb_admin/screens/reports/subscreens/add_report_screen2.dart';

import '../../../logic/controllers/order_controller.dart';
import '../../packages/components/custom_button.dart';
import '../components/order_card.dart';
import '/constants.dart';

class ViewOrderScreen extends StatefulWidget {
  const ViewOrderScreen({
    Key? key,
    this.isEditChoose = false,
    this.isDeleteChoose = false,
    this.isReportUpload = false,
  }) : super(key: key);

  final bool isEditChoose;
  final bool isDeleteChoose;
  final bool isReportUpload;

  @override
  State<ViewOrderScreen> createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  final oController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  String titleMaker() {
    if (widget.isEditChoose) {
      return "Edit Orders";
    } else if (widget.isDeleteChoose) {
      return "Delete Orders";
    } else if (widget.isReportUpload) {
      return "Upload Report - Select order";
    } else {
      return "View Orders";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleMaker()),
      ),
      body: FutureBuilder(
        future: oController.fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<OrderModel> localOrders = snapshot.data as List<OrderModel>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: medPadding),
                    child: CustomButton(
                      label: "Search",
                      color: Colors.blue,
                      onTap: () {},
                      // onTap: () => Get.to(
                      //   () => SearchTestScreen(
                      //     listOfTests: listOfTests,
                      //     isDeleteChoose: widget.isDeleteChoose,
                      //     isEditChoose: widget.isEditChoose,
                      //   ),
                      // ),
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
                              localOrders.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  if (widget.isReportUpload) {
                                    Get.to(() => AddReportScreen2(order: localOrders[index]));
                                  }
                                  // if (widget.isEditChoose) {
                                  //   Get.to(() => EditTestScreen(test: listOfTests[index]));
                                  // }
                                  // if (widget.isDeleteChoose) {
                                  //   Get.to(() => DeleteTestScreen(test: listOfTests[index]));
                                  // }
                                },
                                child: OrderCard(
                                  order: localOrders[index],
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
