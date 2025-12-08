import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool showPasswordToggle; // New optional parameter

  const AuthTextField({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.showPasswordToggle = false, // Default to false
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
      height: 46,
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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