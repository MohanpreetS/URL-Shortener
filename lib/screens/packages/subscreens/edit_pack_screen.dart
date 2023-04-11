import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/controllers/test_controller.dart';
import '/models/package_model.dart';
import '../components/custom_button.dart';
import '../components/logo_selector.dart';
import '../components/package_test_fields.dart';
import '../components/text_fields.dart';
import '/constants.dart';

class EditPackScreen extends StatefulWidget {
  const EditPackScreen({Key? key, required this.package}) : super(key: key);

  final PackageModel package;

  @override
  State<EditPackScreen> createState() => _EditPackScreenState();
}

class _EditPackScreenState extends State<EditPackScreen> {
  final tController = Get.put(TestController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _retailController = TextEditingController();
  final TextEditingController _orderController = TextEditingController();

  String svgLogoValue = "Stethoscope";

  final TextEditingController _ptController1 = TextEditingController();
  final TextEditingController _ptController2 = TextEditingController();
  final TextEditingController _ptController3 = TextEditingController();
  final TextEditingController _ptController4 = TextEditingController();
  final TextEditingController _ptController5 = TextEditingController();
  final TextEditingController _ptController6 = TextEditingController();
  final TextEditingController _ptController7 = TextEditingController();
  final TextEditingController _ptController8 = TextEditingController();
  final TextEditingController _ptController9 = TextEditingController();
  final TextEditingController _ptController10 = TextEditingController();
  final TextEditingController _ptController11 = TextEditingController();
  final TextEditingController _ptController12 = TextEditingController();

  bool isStethoscope = false;
  bool isInjection = false;
  bool isFlask = false;
  bool isMicroscope = false;
  bool isSymbol = false;

  String logoString() {
    if (isInjection) {
      return "assets/injection_purple.svg";
    }
    if (isFlask) {
      return "assets/flask_purple.svg";
    }
    if (isMicroscope) {
      return "assets/microscope_purple.svg";
    }
    if (isSymbol) {
      return "assets/symbol_purple.svg";
    }
    return "assets/stethoscope.svg";
  }

  bool _packageTestError = false;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.package.title;
    _discountController.text = widget.package.discountPrice;
    _retailController.text = widget.package.retailPrice;
    _orderController.text = widget.package.order.toString();

    List<TextEditingController> ptControllers = [
      _ptController1,
      _ptController2,
      _ptController3,
      _ptController4,
      _ptController5,
      _ptController6,
      _ptController7,
      _ptController8,
      _ptController9,
      _ptController10,
      _ptController11,
      _ptController12,
    ];

    for (int i = 0; i < widget.package.listOfTests!.length; i++) {
      ptControllers[i].text = widget.package.listOfTests![i].tests;
    }

    if (widget.package.svgLocation == "assets/stethoscope.svg") {
      isStethoscope = true;
    } else if (widget.package.svgLocation == "assets/injection_purple.svg") {
      isInjection = true;
    } else if (widget.package.svgLocation == "assets/microscope_purple.svg") {
      isMicroscope = true;
    } else if (widget.package.svgLocation == "assets/flask_purple.svg") {
      isFlask = true;
    } else if (widget.package.svgLocation == "assets/symbol_purple.svg") {
      isSymbol = true;
    } else {
      isStethoscope = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        label: "Package Title",
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
                            controller: _discountController,
                            label: "Discount Price",
                          ),
                          NumField(
                            controller: _retailController,
                            label: "Retail Price",
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: NumField(controller: _orderController, label: "Order / Position"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LogoSelector(
                            label: "Stethoscope",
                            lBool: isStethoscope,
                            svgLocation: "assets/stethoscope.svg",
                            onChanged: (value) {
                              setState(() {
                                if (!isStethoscope) {
                                  isStethoscope = true;
                                  isInjection = false;
                                  isFlask = false;
                                  isMicroscope = false;
                                  isSymbol = false;
                                }
                              });
                              svgLogoValue = "Stethoscope";
                            },
                          ),
                          LogoSelector(
                            label: "Injection",
                            lBool: isInjection,
                            svgLocation: "assets/injection_purple.svg",
                            onChanged: (value) {
                              setState(() {
                                if (!isInjection) {
                                  isStethoscope = false;
                                  isInjection = true;
                                  isFlask = false;
                                  isMicroscope = false;
                                  isSymbol = false;
                                }
                              });
                              svgLogoValue = "Injection";
                            },
                          ),
                          LogoSelector(
                            label: "Flask",
                            lBool: isFlask,
                            svgLocation: "assets/flask_purple.svg",
                            onChanged: (value) {
                              setState(() {
                                if (!isFlask) {
                                  isStethoscope = false;
                                  isInjection = false;
                                  isFlask = true;
                                  isMicroscope = false;
                                  isSymbol = false;
                                }
                              });
                              svgLogoValue = "Flask";
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LogoSelector(
                            label: "Microscope",
                            lBool: isMicroscope,
                            svgLocation: "assets/microscope_purple.svg",
                            onChanged: (value) {
                              setState(() {
                                if (!isMicroscope) {
                                  isStethoscope = false;
                                  isInjection = false;
                                  isFlask = false;
                                  isMicroscope = true;
                                  isSymbol = false;
                                }
                              });
                              svgLogoValue = "Microscope";
                            },
                          ),
                          LogoSelector(
                            label: "Symbol",
                            lBool: isSymbol,
                            svgLocation: "assets/symbol_purple.svg",
                            onChanged: (value) {
                              setState(() {
                                if (!isSymbol) {
                                  isStethoscope = false;
                                  isInjection = false;
                                  isFlask = false;
                                  isMicroscope = false;
                                  isSymbol = true;
                                }
                              });
                              svgLogoValue = "Symbol";
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: medPadding),
                          child: Column(
                            children: [
                              const Text(
                                "Tests",
                                style: TextStyle(fontSize: 22),
                              ),
                              if (_packageTestError) const PTestErrorText()
                            ],
                          ),
                        ),
                      ),
                      PackageTestFields(
                        ptController1: _ptController1,
                        ptController2: _ptController2,
                        ptController3: _ptController3,
                        ptController4: _ptController4,
                        ptController5: _ptController5,
                        ptController6: _ptController6,
                        ptController7: _ptController7,
                        ptController8: _ptController8,
                        ptController9: _ptController9,
                        ptController10: _ptController10,
                        ptController11: _ptController11,
                        ptController12: _ptController12,
                      ),
                      if (_packageTestError) const PTestErrorText(),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: largePadding),
                          child: CustomButton(
                            label: "Submit",
                            color: darkPurple,
                            onTap: () async {
                              if (_ptController1.text == "") {
                                setState(() {
                                  _packageTestError = true;
                                });
                              } else {
                                _packageTestError = false;
                                print("stetho $isStethoscope");
                                print(isInjection);
                                print(logoString());
                                if (_formKey.currentState!.validate()) {
                                  PackageModel localPackage = PackageModel(
                                    id: widget.package.id,
                                    title: _titleController.text,
                                    svgLocation: logoString(),
                                    retailPrice: _retailController.text,
                                    discountPrice: _discountController.text,
                                    order: double.parse(_orderController.text),
                                  );

                                  List<TextEditingController> ptControllers = [
                                    _ptController1,
                                    _ptController2,
                                    _ptController3,
                                    _ptController4,
                                    _ptController5,
                                    _ptController6,
                                    _ptController7,
                                    _ptController8,
                                    _ptController9,
                                    _ptController10,
                                    _ptController11,
                                    _ptController12,
                                  ];

                                  List<PackageTest> localPackageTests = [];

                                  for (int i = 0; i < ptControllers.length; i++) {
                                    if (ptControllers[i].text != "") {
                                      localPackageTests.add(
                                        PackageTest(
                                          tests: ptControllers[i].text,
                                          order: (i + 1).toDouble(),
                                        ),
                                      );
                                    }
                                  }
                                  await tController.updatePackage(localPackage, localPackageTests);
                                  tController.valuesChanged = true;
                                  await tController.fetchData();
                                  Get.back();
                                  Get.back();
                                }
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

class PTestErrorText extends StatelessWidget {
  const PTestErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "Please add atleast 1 test to the package",
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    );
  }
}
