import 'package:flutter/material.dart';
import 'client_app/onboarding_screens/onboarding_one.dart';
import 'client_app/onboarding_screens/logo_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,      // for Material surfaces like Drawer
        cardColor: Colors.white,        // cards
        dialogBackgroundColor: Colors.white,
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: LogoScreen(),
    );
  }
}
