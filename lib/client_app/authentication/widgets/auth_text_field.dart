import 'dart:ffi';

import 'package:flutter/material.dart';
// colors import not required here

class AuthTextField extends StatefulWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool showPasswordToggle; // New optional parameter
  final Widget? prefixIcon;
  final double? height;

  const AuthTextField({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.showPasswordToggle = false, // Default to false
    this.prefixIcon,
    this.height = 55,
  }) : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14)
      ),
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: widget.prefixIcon != null ? Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(width: 24, height: 24, child: widget.prefixIcon),
          ) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFC7C7C766)), // Set border color to grey
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey), // Set enabled border color to grey
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   // borderSide: const BorderSide(color: Colors.grey), // Set focused border color to grey
          //   borderSide: const BorderSide(color: Color(0xFFC7C7C766)), // Set border color to grey
          // ),
          suffixIcon: widget.showPasswordToggle
              ? IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: _togglePasswordVisibility,
          )
              : null, // Show icon only if the toggle is enabled
        ),
      ),
    );
  }
}