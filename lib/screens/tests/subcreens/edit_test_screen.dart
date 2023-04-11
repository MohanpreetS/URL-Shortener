import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/models/test_model.dart';

import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import '/constants.dart';

class EditTestScreen extends StatefulWidget {
  const EditTestScreen({Key? key, required this.test}) : super(key: key);

  final TestModel test;

  @override
  State<EditTestScreen> createState() => _EditTestScreenState();
}

class _EditTestScreenState extends State<EditTestScreen> {
  final tController = Get.put(TestController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _orderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.test.title;
    _detailController.text = widget.test.details;
    _priceController.text = widget.test.price;
    _orderController.text = widget.test.order.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Test"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(vertical: largePadding, horizontal: largePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextOnlyField(
                        label: "Test Title",
                        controller: _titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumField(
                            controller: _priceController,
                            label: "Price",
                          ),
                          NumField(
                            controller: _orderController,
                            label: "Order / Position",
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: medPadding),
                          child: Text(
                            "Details",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      BigTextField(
                        controller: _detailController,
                        label: "Details",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: largePadding),
                          child: CustomButton(
                            label: "Submit",
                            color: darkPurple,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                TestModel localTest = TestModel(
                                  id: widget.test.id,
                                  title: _titleController.text,
                                  details: _detailController.text,
                                  price: _priceController.text,
                                  order: double.parse(_orderController.text),
                                );

                                await tController.updateTest(localTest);
                                tController.valuesChanged = true;
                                await tController.fetchData();
                                Get.back();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
