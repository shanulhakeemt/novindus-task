import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/widgets/custom_field.dart';

class TextFormFieldWithLabel extends StatelessWidget {
  const TextFormFieldWithLabel(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      this.isNumber = false});
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              getTextStylePoppins(width: w * .041, weight: FontWeightType.four),
        ),
        SizedBox(
          height: h * .006,
        ),
        CustomField(isNumber: isNumber, hintText: hint, controller: controller),
        SizedBox(
          height: h * .019,
        ),
      ],
    );
  }
}
