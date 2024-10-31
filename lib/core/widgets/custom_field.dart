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
    this.isSearchField = false,
    this.prefIcon,
  });
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool isSearchField;
  final Icon? prefIcon;

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
        prefixIcon: prefIcon,
        prefixIconColor: Pallete.hintTextColor,
        contentPadding: EdgeInsets.all(isSearchField ? 10 : 18),
        hintStyle: GoogleFonts.inter(
            color: Pallete.hintTextColor,
            fontWeight: FontWeight.w300,
            fontSize: isSearchField ? w * .034 : w * .04),
        hintText: hintText,
      ),
    );
  }
}
