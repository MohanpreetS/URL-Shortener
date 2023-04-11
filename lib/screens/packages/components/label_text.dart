import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.label,
    required this.text,
    this.isCenter = false,
    //this.width = 500,
  });

  final String label;
  final String text;
  final bool isCenter;
  //final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: width,
      child: Row(
        mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$label ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$text ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class LabelTextSpaced extends StatelessWidget {
  const LabelTextSpaced({
    super.key,
    required this.label,
    required this.text,
    this.isCenter = false,
    this.width = 500,
  });

  final String label;
  final String text;
  final bool isCenter;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$label ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$text ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
