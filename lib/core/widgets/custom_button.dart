import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onTap});

  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Pallete.secondoryColor,
          borderRadius: BorderRadius.circular(8.52)),
      height: h * .06,
      child: Center(
        child: Text(
          buttonText,
          style: getTextStylePoppins(
              width: w * .04,
              color: Pallete.whiteColor,
              weight: FontWeightType.six),
        ),
      ),
    );
  }
}
