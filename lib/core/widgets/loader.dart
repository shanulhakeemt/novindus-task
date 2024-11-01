import 'package:flutter/material.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color = Pallete.secondoryColor,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
