import 'package:flutter/material.dart';

class AuthController {
  // Simple validators
  String? validateName(String? v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null;
  String? validateEmail(String? v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null;
  String? validatePassword(String? v) => (v == null || v.length < 6) ? 'Password must be 6+ chars' : null;

  // Mock OTP verification (accepts '1234')
  Future<bool> verifyOtp(String code) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return code == '1234';
  }
}
