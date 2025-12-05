import 'package:flutter/material.dart';

class LocationInputField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onCalendarTap;
  final VoidCallback? onTap;
  final IconData leadingIcon;

  const LocationInputField({
    super.key,
    required this.hintText,
    this.onCalendarTap,
    this.onTap,
    this.leadingIcon = Icons.location_on_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: Colors.grey.shade700,
              size: 20,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                hintText,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            GestureDetector(
              onTap: onCalendarTap,
              child: Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
