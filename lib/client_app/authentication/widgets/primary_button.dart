import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;  // Make this nullable
  final Color? textColor;
  final double? height;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height,
    this.textColor = Colors.white,
    this.color,  // This can now be null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey
        // )
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,  // Use color if provided, otherwise use primaryColor
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: Text(
          label,
          style:  TextStyle(
              color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}