import 'package:flutter/material.dart';

import '/constants.dart';

class GenderCheckBox extends StatelessWidget {
  const GenderCheckBox({
    Key? key,
    required this.isMale,
    required this.isMaleValueSet,
    required this.ontap,
    required this.label,
  }) : super(key: key);

  final String label;
  final bool isMale;
  final bool isMaleValueSet;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: (isMale && isMaleValueSet)
              ? Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    color: pinkPurple,
                    //color: isMale ?  : Colors.white,
                    //color: isMale ?  : Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: smallPadding),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              //fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
