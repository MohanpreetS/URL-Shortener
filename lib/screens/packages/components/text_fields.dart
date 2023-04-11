import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class NumField extends StatelessWidget {
  const NumField({
    super.key,
    required TextEditingController controller,
    required this.label,
    this.isPhoneNum = false,
    this.isOtp = false,
    this.width = 100,
    this.maxLen,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String label;
  final bool isPhoneNum;
  final bool isOtp;
  final double width;
  final int? maxLen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: medPadding,
            bottom: smallPadding,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: _controller,
            maxLength: maxLen,
            validator: (value) {
              RegExp regex = RegExp(r'[0-9]$');
              if (value!.isEmpty) {
                return "field can't be empty";
              }
              if (!regex.hasMatch(value)) {
                return "enter a number upto 5 digits";
              }
              if (value.length > 5 && !isPhoneNum && !isOtp) {
                return "enter a number upto 5 digits";
              }
              if (value.length != 10 && isPhoneNum) {
                return "Please enter 10 digits";
              }
              if (value.length != 6 && isOtp) {
                return "Please enter 6 digits";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp("[0-9]"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextOnlyField extends StatelessWidget {
  const TextOnlyField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPass = false,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: medPadding,
              bottom: smallPadding,
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: isPass,
          ),
        ],
      ),
    );
  }
}

class BigTextField extends StatelessWidget {
  const BigTextField({super.key, required this.controller, required this.label, this.validator});

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: medPadding,
              bottom: smallPadding,
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(),
            keyboardType: TextInputType.multiline,
            controller: controller,
            validator: validator,
            maxLines: null,
            minLines: 4,
          ),
        ],
      ),
    );
  }
}
