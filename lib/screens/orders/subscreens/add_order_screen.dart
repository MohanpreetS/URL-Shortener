import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sb_admin/logic/controllers/test_controller.dart';
import 'package:sb_admin/models/order_item_model.dart';
import 'package:sb_admin/models/order_model.dart';
import 'package:sb_admin/models/test_model.dart';

import '../../../logic/controllers/order_controller.dart';
import '../../../logic/repositories/auth_repo.dart';
import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import '../components/num_checkbox.dart';
import '../components/package_test_switch.dart';
import '../components/test_package_field.dart';
import '/constants.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final oController = Get.put(OrderController());
  final aController = Get.put(AuthRepo());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _testController1 = TextEditingController();
  final TextEditingController _retailController1 = TextEditingController();
  final TextEditingController _discountController1 = TextEditingController();

  final TextEditingController _testController2 = TextEditingController();
  final TextEditingController _retailController2 = TextEditingController();
  final TextEditingController _discountController2 = TextEditingController();

  final TextEditingController _testController3 = TextEditingController();
  final TextEditingController _retailController3 = TextEditingController();
  final TextEditingController _discountController3 = TextEditingController();

  final TextEditingController _testController4 = TextEditingController();
  final TextEditingController _retailController4 = TextEditingController();
  final TextEditingController _discountController4 = TextEditingController();

  final TextEditingController _testController5 = TextEditingController();
  final TextEditingController _retailController5 = TextEditingController();
  final TextEditingController _discountController5 = TextEditingController();

  final TextEditingController _testController6 = TextEditingController();
  final TextEditingController _retailController6 = TextEditingController();
  final TextEditingController _discountController6 = TextEditingController();

  bool _isPackage1 = false;
  bool _isPackage2 = false;
  bool _isPackage3 = false;
  bool _isPackage4 = false;
  bool _isPackage5 = false;
  bool _isPackage6 = false;

  int numItems = 1;

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> _testControllers = [
      _testController1,
      _testController2,
      _testController3,
      _testController4,
      _testController5,
      _testController6
    ];

    final List<TextEditingController> _retailControllers = [
      _retailController1,
      _retailController2,
      _retailController3,
      _retailController4,
      _retailController5,
      _retailController6
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Package"),
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
                        label: "First Name",
                        controller: _fNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextOnlyField(
                        label: "Last Name",
                        controller: _lNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextOnlyField(
                        label: "Phone Number",
                        controller: _phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                      ),
                      //TODO:Make this num field
                      // NumField(
                      //   controller: _phoneController,
                      //   label: "Phone Number",
                      //   width: double.infinity,
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: medPadding),
                          child: CustomButton(
                            label: "Search User",
                            color: darkBlue,
                            onTap: () async {},
                          ),
                        ),
                      ),
                      const SizedBox(height: medPadding),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Number of Tests/Packages",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: medPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            3,
                            (index) => NumCheckbox(
                                numItems: numItems,
                                onChanged: () {
                                  setState(() {
                                    numItems = index + 1;
                                  });
                                },
                                num: index + 1),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            3,
                            (index) => NumCheckbox(
                                numItems: numItems,
                                onChanged: () {
                                  setState(() {
                                    numItems = index + 4;
                                  });
                                },
                                num: index + 4),
                          ),
                        ],
                      ),
                      if (numItems >= 1)
                        TestPackageField(
                          isPackage: _isPackage1,
                          testController: _testController1,
                          retailController: _retailController1,
                          discountController: _discountController1,
                          onChanged: () => setState(() {
                            _isPackage1 = !_isPackage1;
                          }),
                        ),
                      if (numItems >= 2)
                        TestPackageField(
                          isPackage: _isPackage2,
                          testController: _testController2,
                          retailController: _retailController2,
                          discountController: _discountController2,
                          onChanged: () => setState(() {
                            _isPackage2 = !_isPackage2;
                          }),
                        ),
                      if (numItems >= 3)
                        TestPackageField(
                          isPackage: _isPackage3,
                          testController: _testController3,
                          retailController: _retailController3,
                          discountController: _discountController3,
                          onChanged: () => setState(() {
                            _isPackage3 = !_isPackage3;
                          }),
                        ),
                      if (numItems >= 4)
                        TestPackageField(
                          isPackage: _isPackage4,
                          testController: _testController4,
                          retailController: _retailController4,
                          discountController: _discountController4,
                          onChanged: () => setState(() {
                            _isPackage4 = !_isPackage4;
                          }),
                        ),
                      if (numItems >= 5)
                        TestPackageField(
                          isPackage: _isPackage5,
                          testController: _testController5,
                          retailController: _retailController5,
                          discountController: _discountController5,
                          onChanged: () => setState(() {
                            _isPackage5 = !_isPackage5;
                          }),
                        ),
                      if (numItems >= 6)
                        TestPackageField(
                          isPackage: _isPackage6,
                          testController: _testController6,
                          retailController: _retailController6,
                          discountController: _discountController6,
                          onChanged: () => setState(() {
                            _isPackage6 = !_isPackage6;
                          }),
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
                                final employeeId = await aController.giveAdminEmail()!;
                                final customerName = _fNameController.text + _lNameController.text;
                                DateFormat dateFormat = DateFormat("yyyyMMddHHmmss");
                                String dateTime = dateFormat.format(DateTime.now());
                                OrderModel localOrder = OrderModel(
                                  employeeId: employeeId,
                                  customerId: "hbajshdbhjb",
                                  customerName: customerName,
                                  customerPhone: _phoneController.text,
                                  status: "Pending",
                                  dateTime: dateTime,
                                );
                                List<OrderItemModel> listOfItems = [];

                                for (int i = 0; i < numItems; i++) {
                                  OrderItemModel localItem = OrderItemModel(
                                      testId: "adsf",
                                      retailPrice: _retailControllers[i].text,
                                      discountPrice: "",
                                      testName: _testControllers[i].text);

                                  listOfItems.add(localItem);
                                }

                                await oController.addOrder(localOrder, listOfItems);
                                oController.valuesChanged = true;
                                await oController.fetchOrders();
                                Get.back();

                                //await oController.addOrder(localOrder), listOfItems)

                                //   TestModel localTest = TestModel(
                                //     title: _titleController.text,
                                //     details: _detailController.text,
                                //     price: _priceController.text,
                                //     order: double.parse(_orderController.text),
                                //   );

                                //   await tController.addTest(localTest);
                                //   tController.valuesChanged = true;
                                //   await tController.fetchData();
                                //   Get.back();
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
