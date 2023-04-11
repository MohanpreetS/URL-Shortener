import 'package:flutter/material.dart';

import '../../../constants.dart';

class PackageTestSwitch extends StatelessWidget {
  const PackageTestSwitch({
    super.key,
    required bool isPackage,
    required this.onChanged,
  }) : _isPackage = isPackage;

  final bool _isPackage;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Test",
          style: TextStyle(fontSize: 20),
        ),
        Switch(
          value: _isPackage,
          onChanged: (_) {
            onChanged();
          },
          inactiveThumbColor: darkBlue,
          inactiveTrackColor: darkBlue.withOpacity(0.5),
        ),
        const Text(
          "Package",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
