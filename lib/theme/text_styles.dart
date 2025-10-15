import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle heading(BuildContext context) => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      );

  static TextStyle subtitle(BuildContext context) => const TextStyle(
        fontSize: 14,
        color: Colors.black54,
      );

  static TextStyle body(BuildContext context) => const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      );
}
