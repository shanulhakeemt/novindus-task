import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/widgets/loader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      required this.textSize,
      required this.containerHeight,
      this.isLoading = false});

  final String buttonText;
  final VoidCallback? onTap;
  final double textSize;
  final double containerHeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: w * .2),
        decoration: BoxDecoration(
            color: Pallete.secondoryColor,
            borderRadius: BorderRadius.circular(8.52)),
        height: containerHeight,
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: h * .03,
                  width: h * .03,
                  child: const Loader(
                    color: Pallete.backgroundColor,
                  ))
              : Text(
                  buttonText,
                  style: getTextStylePoppins(
                      width: textSize,
                      color: Pallete.whiteColor,
                      weight: FontWeightType.six),
                ),
        ),
      ),
    );
  }
}
