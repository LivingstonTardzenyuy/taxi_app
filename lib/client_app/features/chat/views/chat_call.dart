
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F6A6C), // Teal background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40),

          /// CENTER AREA (Avatar + Name + Timer)
          Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/img.png", // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              const Text(
                "Kendrick Anne",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "2:15",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          /// BOTTOM CONTROLS
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: const BoxDecoration(
              color: Color(0xFF276E70),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Speaker
                _buildBottomIcon(
                  icon: CupertinoIcons.speaker_2_fill,
                ),

                /// Microphone
                _buildBottomIcon(
                  icon: CupertinoIcons.mic_fill,
                ),

                /// End Call (Red)
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    CupertinoIcons.phone_down_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                /// Video
                _buildBottomIcon(
                  icon: CupertinoIcons.video_camera_solid,
                ),

                /// Chat
                _buildBottomIcon(
                  icon: CupertinoIcons.chat_bubble_fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable bottom icon widget
  Widget _buildBottomIcon({required IconData icon}) {
    return Container(
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFDCE8C9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        icon,
        color: Colors.grey,
        size: 28,
      ),
    );
  }
}
