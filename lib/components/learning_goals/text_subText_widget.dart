import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';

class GoalTextBodyWidget extends StatelessWidget {
  final String heading;
  final String subText;

  GoalTextBodyWidget({
    required this.heading,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          heading,
          style: kGilroy28700,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          subText,
          style: kGilroy16500,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}