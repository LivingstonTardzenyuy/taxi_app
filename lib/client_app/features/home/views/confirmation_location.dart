import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';
import 'package:taxi_app/client_app/features/saved_places/views/agencies_screen.dart';

class ConfirmLocationScreen extends StatelessWidget {
  const ConfirmLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [

            /// ---------- MAP BACKGROUND ----------
            Positioned.fill(
              child: Image.asset(
                'assets/map_bg.png',
                fit: BoxFit.cover,
              ),
            ),

            /// ---------- BACK BUTTON ----------
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black87,
                ),
              ),
            ),

            /// ---------- TOP TITLE ----------
            Positioned(
              top: 10,
              left: 50,
              child: const Text(
                "Departure town",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            /// ---------- STREET NAME ----------
            Positioned(
              top: 34,
              left: 50,
              child: const Text(
                "Sarah Avenue",
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF0A3A34),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            /// ---------- SEARCH BAR ----------
            Positioned(
              top: 78,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Placibo Rety street down town 2234",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A3A34),
                        ),
                      ),
                    ),
                    Icon(Icons.close, size: 18),
                  ],
                ),
              ),
            ),

            /// ---------- ROUTE LINE (CUSTOM PAINT) ----------
            Positioned.fill(
              child: CustomPaint(
                painter: RoutePainter(),
              ),
            ),

            /// ---------- CAR ICON ----------
            Positioned(
              bottom: 210,
              left: MediaQuery.of(context).size.width * 0.42,
              child: Image.asset(
                'assets/images/car_icon.png',
                width: 60,
              ),
            ),

            /// ---------- LOCATE-ME FLOATING BUTTON ----------
            Positioned(
              bottom: 200,
              right: 20,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.12),
                      blurRadius: 6,
                    )
                  ],
                ),
                child: const Icon(Icons.gps_fixed, size: 20),
              ),
            ),

            /// ---------- CONFIRM BUTTON ----------
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: PrimaryButton(
                  label: "Confirm Location",
                  onPressed: () {
                    Get.to(AgenciesScreen());
                  }
              )
            ),

          ],
        ),
      ),
    );
  }
}





class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0A3A34)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // START (top-left area)
    path.moveTo(100, 150);

    // Horizontal → Vertical → Down path
    path.lineTo(200, 150);
    path.lineTo(200, 350);
    path.lineTo(200, 550);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
