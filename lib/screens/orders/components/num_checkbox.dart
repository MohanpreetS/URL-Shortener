import 'package:flutter/material.dart';

class NumCheckbox extends StatelessWidget {
  const NumCheckbox({
    super.key,
    required this.numItems,
    required this.onChanged,
    required this.num,
  });

  final int numItems;
  final VoidCallback onChanged;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: numItems == num,
          onChanged: (_) => onChanged(),
        ),
        Text(
          "  $num",
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
