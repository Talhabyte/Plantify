import 'package:flutter/material.dart';
import '../../../../core/utils/route_names.dart';
import '../../../../core/widgets/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the Sizer helper
    final sizer = ResponsiveSizer(context);

    final titleFont = sizer.w(0.07);
    final descFont = sizer.fontText;
    final buttonHeight = sizer.h(0.07);
    final buttonWidth = sizer.w(0.8);

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
                  SizedBox(height: sizer.spacingM),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizer.w(0.08)),
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
                  SizedBox(height: sizer.h(0.05)),
                  // Buttons
                  ElevatedButton.icon(
                    // Use RouteNames constant
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteNames.home),
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
                  SizedBox(height: sizer.spacingM),
                  ElevatedButton.icon(
                    // Use RouteNames constant
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteNames.guide),
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
            bottom: sizer.spacingM,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "© 2023 PlantHealth - All rights reserved",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: sizer.w(0.03),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
