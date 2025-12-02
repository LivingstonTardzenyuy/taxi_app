import 'package:flutter/material.dart';

class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  TermsCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
         Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'I have read and accept the ',
                  style: TextStyle(color: Colors.black), // Normal text style
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Bold text style
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}