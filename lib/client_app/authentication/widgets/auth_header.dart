import 'package:flutter/material.dart';
import '../../../theme/text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.heading(context).copyWith(
          color: Color(0xFF3A3A3A)
        )),
        const SizedBox(height: 8),
        Text(subtitle, style: TextStyles.subtitle(context)),
      ],
    );
  }
}
