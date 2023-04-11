import 'package:flutter/material.dart';
import 'package:sb_admin/models/user_model.dart';

import '../../../constants.dart';
import '../../packages/components/label_text.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: medPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: medPadding,
      ),
      height: 180,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          LabelText(
            label: "First Name:   ",
            text: user.firstName,
          ),
          const SizedBox(height: smallPadding),
          LabelText(
            label: "Last Name:   ",
            text: user.lastName,
          ),
          const SizedBox(height: smallPadding),
          LabelText(
            label: "Phone No:    ",
            text: user.phoneNo,
          ),
          const SizedBox(height: smallPadding),
          LabelText(
            label: "DOB:              ",
            text: user.dob,
          ),
          const SizedBox(height: smallPadding),
          LabelText(
            label: "Gender:         ",
            text: user.gender,
          ),
        ],
      ),
    );
  }
}
