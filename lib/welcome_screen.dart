import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFont = size.width * 0.07;
    final descFont = size.width * 0.045;
    final buttonHeight = size.height * 0.07;
    final buttonWidth = size.width * 0.8;

    return Scaffold(
      body: Stack(
        children: [
          // 🌿 Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "Plant Disease Identifier",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFont,
                      color: const Color(0xff284C29),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Description
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: Text(
                      "Scan leaves to identify diseases and get treatment recommendations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: descFont,
                        color: const Color(0xff2F6030),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  // Buttons
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    label: const Text("Scan Leaf",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff387939),
                      minimumSize: Size(buttonWidth, buttonHeight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/guide'),
                    icon: const Icon(Icons.book, color: Color(0xff2F6030)),
                    label: const Text("View Disease Guide",
                        style: TextStyle(color: Color(0xff2F6030))),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      minimumSize: Size(buttonWidth, buttonHeight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          Positioned(
            bottom: size.height * 0.02,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "© 2023 PlantHealth - All rights reserved",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
