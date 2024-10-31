import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onTap,
  });
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.inter(
            color: Pallete.hintTextColor,
            fontWeight: FontWeight.w300,
            fontSize: w * .04),
        hintText: hintText,
      ),
    );
  }
}
