import 'package:flutter/material.dart';

import 'text_fields.dart';

class PackageTestFields extends StatelessWidget {
  const PackageTestFields({
    super.key,
    required TextEditingController ptController1,
    required TextEditingController ptController2,
    required TextEditingController ptController3,
    required TextEditingController ptController4,
    required TextEditingController ptController5,
    required TextEditingController ptController6,
    required TextEditingController ptController7,
    required TextEditingController ptController8,
    required TextEditingController ptController9,
    required TextEditingController ptController10,
    required TextEditingController ptController11,
    required TextEditingController ptController12,
  })  : _ptController1 = ptController1,
        _ptController2 = ptController2,
        _ptController3 = ptController3,
        _ptController4 = ptController4,
        _ptController5 = ptController5,
        _ptController6 = ptController6,
        _ptController7 = ptController7,
        _ptController8 = ptController8,
        _ptController9 = ptController9,
        _ptController10 = ptController10,
        _ptController11 = ptController11,
        _ptController12 = ptController12;

  final TextEditingController _ptController1;
  final TextEditingController _ptController2;
  final TextEditingController _ptController3;
  final TextEditingController _ptController4;
  final TextEditingController _ptController5;
  final TextEditingController _ptController6;
  final TextEditingController _ptController7;
  final TextEditingController _ptController8;
  final TextEditingController _ptController9;
  final TextEditingController _ptController10;
  final TextEditingController _ptController11;
  final TextEditingController _ptController12;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOnlyField(controller: _ptController1, label: "Package Tests 1"),
        TextOnlyField(controller: _ptController2, label: "Package Tests 2"),
        TextOnlyField(controller: _ptController3, label: "Package Tests 3"),
        TextOnlyField(controller: _ptController4, label: "Package Tests 4"),
        TextOnlyField(controller: _ptController5, label: "Package Tests 5"),
        TextOnlyField(controller: _ptController6, label: "Package Tests 6"),
        TextOnlyField(controller: _ptController7, label: "Package Tests 7"),
        TextOnlyField(controller: _ptController8, label: "Package Tests 8"),
        TextOnlyField(controller: _ptController9, label: "Package Tests 9"),
        TextOnlyField(controller: _ptController10, label: "Package Tests 10"),
        TextOnlyField(controller: _ptController11, label: "Package Tests 11"),
        TextOnlyField(controller: _ptController12, label: "Package Tests 12"),
      ],
    );
  }
}
