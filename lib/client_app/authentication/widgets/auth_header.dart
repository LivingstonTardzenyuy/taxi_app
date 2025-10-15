import 'package:flutter/material.dart';
import '../../../theme/text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.heading(context)),
        const SizedBox(height: 8),
        Text(subtitle, style: TextStyles.subtitle(context)),
      ],
    );
  }
}
