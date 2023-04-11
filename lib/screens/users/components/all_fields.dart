import 'package:flutter/material.dart';

import '/constants.dart';
import 'edit_field.dart';

class DOBField extends StatelessWidget {
  const DOBField({
    Key? key,
    required TextEditingController dateController,
    required this.onTap,
    required this.dateNode,
    this.title = "Date of Birth",
  })  : _dateController = dateController,
        super(key: key);

  final TextEditingController _dateController;
  final VoidCallback onTap;
  final FocusNode dateNode;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: medPadding, bottom: smallPadding / 2),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
        Stack(
          children: [
            TextFormField(
              focusNode: dateNode,
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return "DOB can't be empty";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "DD/MM/YYYY"),
              readOnly: true,
              onTap: onTap,
            ),
            IgnorePointer(
              child: Container(
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

class LastNameField extends StatelessWidget {
  const LastNameField({
    Key? key,
    required FocusNode lastNameNode,
    required TextEditingController lastNameController,
    this.initialValue = "",
  })  : _lastNameNode = lastNameNode,
        _lastNameController = lastNameController,
        super(key: key);

  final FocusNode _lastNameNode;
  final TextEditingController _lastNameController;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return EditField(
      label: "Last Name",
      focusNode: _lastNameNode,
      hintText: "Last Name",
      controller: _lastNameController,
      initialValue: initialValue,
      validator: (value) {
        final validCharacters = RegExp(r'^[a-zA-Z]+$');
        if (value!.isEmpty) {
          return "Last Name can't be empty";
        } else if (!validCharacters.hasMatch(value)) {
          return "Only alphabets are allowed";
        }
        return null;
      },
    );
  }
}

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    Key? key,
    required FocusNode firstNameNode,
    required TextEditingController firstNameController,
    this.initialValue = "",
  })  : _firstNameNode = firstNameNode,
        _firstNameController = firstNameController,
        super(key: key);

  final FocusNode _firstNameNode;
  final TextEditingController _firstNameController;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return EditField(
      label: "First Name",
      focusNode: _firstNameNode,
      hintText: "First Name",
      controller: _firstNameController,
      initialValue: initialValue,
      validator: (value) {
        final validCharacters = RegExp(r'^[a-zA-Z]+$');
        if (value!.isEmpty) {
          return "First Name can't be empty";
        } else if (!validCharacters.hasMatch(value)) {
          return "Only alphabets are allowed";
        }
        return null;
      },
    );
  }
}
