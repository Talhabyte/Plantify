import 'package:flutter/material.dart';
import '../../../../core/utils/route_names.dart';
import '../../../../core/widgets/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      // Use RouteNames constant
      Navigator.pushReplacementNamed(context, RouteNames.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the Sizer helper
    final sizer = ResponsiveSizer(context);
    final iconSize = sizer.iconXL;
    final fontSize = sizer.w(0.09); // Keep original large font size

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: sizer.w(0.25), top: sizer.h(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.eco_outlined,
                    size: iconSize,
                    color: const Color(0xFF387939),
                  ),
                  SizedBox(width: sizer.w(0.02)),
                  Text(
                    "Plantify",
                    style: TextStyle(
                      color: const Color(0xFF284C29),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
