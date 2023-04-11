import 'package:flutter/material.dart';

import '/models/test_model.dart';
import '../../../constants.dart';
import '../../packages/components/label_text.dart';

class TestCard extends StatelessWidget {
  const TestCard({
    super.key,
    required this.test,
  });

  final TestModel test;

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
      //height: 300,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                "(${test.order}) ${test.title}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Price: ",
              text: test.price,
              isCenter: true,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Text(
            test.details,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
