import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext) {
    return Builder(
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final iconSize = size.width * 0.1;
        final fontSizeTitle = size.width * 0.055;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.eco_outlined,
                size: iconSize, color: AppColors.primaryGreen),
            SizedBox(width: size.width * 0.02),
            Text(
              title,
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: fontSizeTitle,
              ),
            ),
          ],
        );
      },
    );
  }
}
