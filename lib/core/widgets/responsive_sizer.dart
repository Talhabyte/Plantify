import 'package:flutter/material.dart';

// This Sizer class helps centralize responsive calculations,
// making the UI code in the screens cleaner.
class ResponsiveSizer {
  final BuildContext context;
  final Size size;

  ResponsiveSizer(this.context) : size = MediaQuery.of(context).size;

  // Width percentages
  double w(double percent) => size.width * percent;

  // Height percentages
  double h(double percent) => size.height * percent;

  // Standard spacings (can be customized)
  double get spacingS => h(0.01);
  double get spacingM => h(0.02);
  double get spacingL => h(0.04);

  // Font Sizes (Based on width)
  double get fontTitle => w(0.055);
  double get fontText => w(0.045);
  double get fontSmall => w(0.035);

  // Icon Sizes
  double get iconLarge => w(0.1);
  double get iconXL => w(0.18);
  double get iconM => w(0.08);
}
