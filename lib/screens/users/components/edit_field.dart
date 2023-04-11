import 'package:flutter/material.dart';

import '/constants.dart';

class EditField extends StatefulWidget {
  const EditField({
    Key? key,
    required this.focusNode,
    required this.label,
    required this.hintText,
    this.width = double.infinity,
    this.maxLength = 20,
    required this.controller,
    this.validator,
    this.isNum = false,
    this.initialValue = "",
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String hintText;
  final double width;
  final int maxLength;
  final String initialValue;
  final String? Function(String?)? validator;
  final bool isNum;

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  Color _color = Colors.white;

  @override
  void initState() {
    if (widget.initialValue != "") {
      widget.controller.text = widget.initialValue;
    }

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          _color = darkPurple.withOpacity(0.1);
        });
      } else {
        setState(() {
          _color = Colors.white;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: medPadding, bottom: smallPadding / 2),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: widget.width,
              child: TextFormField(
                controller: widget.controller,
                maxLength: widget.maxLength,
                focusNode: widget.focusNode,
                validator: (value) => widget.validator!(value),
                keyboardType: widget.isNum ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  fillColor: _color,
                  focusColor: darkPurple.withOpacity(0.1),
                  filled: true,
                ),
              ),
            ),
            IgnorePointer(
              child: Container(
                width: widget.width,
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
