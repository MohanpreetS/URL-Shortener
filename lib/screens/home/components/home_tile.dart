import 'package:flutter/material.dart';

import '/constants.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    required this.onTap,
    required this.label,
    required this.color,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medPadding),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              label,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
