import 'package:flutter/material.dart';
import 'package:sound_classify_app/thems/app_colors.dart';

class SmallRadiusPinkButton extends StatelessWidget {
  const SmallRadiusPinkButton(
      {super.key, required this.text, required this.onPressed});

  final Text text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.pink,
        textStyle: const TextStyle(fontSize: 24),
        fixedSize: const Size(172, 52),
      ),
      child: text,
    );
  }
}
