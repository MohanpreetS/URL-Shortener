import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoSelector extends StatelessWidget {
  const LogoSelector({
    super.key,
    required this.lBool,
    required this.label,
    required this.svgLocation,
    required this.onChanged,
  });

  final bool lBool;
  final String label;
  final String svgLocation;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: SvgPicture.asset(svgLocation),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        Switch(
          value: lBool,
          onChanged: onChanged,
        )
      ],
    );
  }
}
