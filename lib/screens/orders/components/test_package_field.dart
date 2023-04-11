import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../packages/components/custom_button.dart';
import '../../packages/components/text_fields.dart';
import 'package_test_switch.dart';

class TestPackageField extends StatelessWidget {
  const TestPackageField({
    super.key,
    required bool isPackage,
    required TextEditingController testController,
    required TextEditingController retailController,
    required TextEditingController discountController,
    required this.onChanged,
  })  : _isPackage = isPackage,
        _testController = testController,
        _retailController = retailController,
        _discountController = discountController;

  final bool _isPackage;
  final TextEditingController _testController;
  final TextEditingController _retailController;
  final TextEditingController _discountController;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PackageTestSwitch(
          isPackage: _isPackage,
          onChanged: onChanged,
        ),
        TextOnlyField(
          label: _isPackage ? "Package Name" : "Test Name",
          controller: _testController,
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
              controller: _retailController,
              label: "Retail Price",
            ),
            NumField(
              controller: _discountController,
              label: "Discount Price",
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: medPadding),
            child: CustomButton(
              label: _isPackage ? "Search Package" : "Search Test",
              color: lightBlue,
              onTap: () async {},
            ),
          ),
        ),
        const SizedBox(
          height: smallPadding,
        ),
        const Divider(
          color: Colors.black54,
        ),
        const SizedBox(
          height: smallPadding,
        )
      ],
    );
  }
}
