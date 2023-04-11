import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Grid4Menu extends StatelessWidget {
  const Grid4Menu({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double spacing = Responsive.valueMaker(
      context: context,
      pc: hugePadding,
      tablet: largePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    double hspacing = Responsive.valueMaker(
      context: context,
      pc: size.width * 0.24,
      tablet: hugePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    return Align(
      alignment: Alignment.center,
      child: Container(
        //height: tileHeight,
        //width: tileHeight * 3 / 2,
        margin: EdgeInsets.only(
          top: spacing,
          left: hspacing,
          right: hspacing,
          bottom: medPadding,
        ),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          children: children,
        ),
      ),
    );
  }
}

class Grid6Menu extends StatelessWidget {
  const Grid6Menu({
    Key? key,
    required this.size,
    required this.children,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    double spacing = Responsive.valueMaker(
      context: context,
      pc: hugePadding,
      tablet: largePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    double hspacing = Responsive.valueMaker(
      context: context,
      pc: hugePadding * 2,
      tablet: hugePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    double cac = Responsive.valueMaker(
      context: context,
      pc: 3,
      tablet: 3,
      largeMobile: 2,
      mobile: 1,
    );

    return Align(
      alignment: Alignment.center,
      child: Container(
        // height: size.height * 0.6,
        // width: size.width * 0.6,
        margin: EdgeInsets.symmetric(vertical: spacing, horizontal: hspacing),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: cac.toInt(),
          childAspectRatio: 3 / 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          children: children,
        ),
      ),
    );
  }
}

class Grid8Menu extends StatelessWidget {
  const Grid8Menu({
    Key? key,
    required this.size,
    required this.children,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    double spacing = Responsive.valueMaker(
      context: context,
      pc: hugePadding,
      tablet: largePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    double hspacing = Responsive.valueMaker(
      context: context,
      pc: hugePadding * 2,
      tablet: hugePadding,
      largeMobile: medPadding,
      mobile: medPadding,
    );
    double cac = Responsive.valueMaker(
      context: context,
      pc: 4,
      tablet: 4,
      largeMobile: 2,
      mobile: 1,
    );

    return Align(
      alignment: Alignment.center,
      child: Container(
        // height: size.height * 0.6,
        // width: size.width * 0.6,
        margin: EdgeInsets.symmetric(vertical: spacing, horizontal: hspacing),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: cac.toInt(),
          childAspectRatio: 3 / 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          children: children,
        ),
      ),
    );
  }
}
