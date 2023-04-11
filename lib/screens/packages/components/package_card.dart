import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/package_model.dart';
import 'package_prices.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.package,
  });

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: medPadding,
            horizontal: medPadding,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: largePadding,
            vertical: medPadding,
          ),
          height: 300 + (package.listOfTests!.length - 6) * 25,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  "(${package.order}) ${package.title}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PackagePrices(
                dLabel: "Discounted Price: ",
                dText: "₹ ${package.discountPrice}",
                rLabel: "Retail Price: ",
                rText: "₹ ${package.retailPrice}",
              ),
              FittedBox(
                child: Text(
                  "Package Tests: ",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              ...List.generate(
                package.listOfTests!.length,
                (index) => PackageBullet(packageTest: package.listOfTests![index]),
              ),
            ],
          ),
        ),
        Positioned(
          top: medPadding,
          right: medPadding,
          child: SizedBox(
            height: 60,
            width: 60,
            child: SvgPicture.asset(package.svgLocation),
          ),
        ),
      ],
    );
  }
}

class PackageBullet extends StatelessWidget {
  const PackageBullet({
    super.key,
    required this.packageTest,
  });

  final PackageTest packageTest;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        "${packageTest.order}) ${packageTest.tests}",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
