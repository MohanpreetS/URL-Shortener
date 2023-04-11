import 'package:flutter/material.dart';
import 'package:sb_admin/responsive.dart';

import '../../../constants.dart';
import 'label_text.dart';

class PackagePrices extends StatelessWidget {
  const PackagePrices({
    super.key,
    required this.dLabel,
    required this.dText,
    required this.rLabel,
    required this.rText,
  });

  final String dLabel;
  final String dText;
  final String rLabel;
  final String rText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallPadding, horizontal: medPadding),
      child: Responsive(
        mobile: ColPrices(dLabel: dLabel, dText: dText, rLabel: rLabel, rText: rText),
        tablet: RowPrices(dLabel: dLabel, dText: dText, rLabel: rLabel, rText: rText),
        desktop: RowPrices(dLabel: dLabel, dText: dText, rLabel: rLabel, rText: rText),
      ),
    );
  }
}

class ColPrices extends StatelessWidget {
  const ColPrices({
    super.key,
    required this.dLabel,
    required this.dText,
    required this.rLabel,
    required this.rText,
  });

  final String dLabel;
  final String dText;
  final String rLabel;
  final String rText;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: smallPadding),
          child: LabelText(
            label: dLabel,
            text: dText,
          ),
        ),
        LabelText(
          label: rLabel,
          text: rText,
        ),
      ],
    );
  }
}

class RowPrices extends StatelessWidget {
  const RowPrices({
    super.key,
    required this.dLabel,
    required this.dText,
    required this.rLabel,
    required this.rText,
  });

  final String dLabel;
  final String dText;
  final String rLabel;
  final String rText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: smallPadding),
          child: LabelText(
            label: dLabel,
            text: dText,
          ),
        ),
        LabelText(
          label: rLabel,
          text: rText,
        ),
      ],
    );
  }
}
