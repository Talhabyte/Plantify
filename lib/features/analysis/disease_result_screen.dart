import 'package:flutter/material.dart';
// Import Core Components and Data Logic
import '../../../../core/widgets/app_bar_title.dart';
import '../../../../core/widgets/responsive_sizer.dart';
import '../../../../core/utils/route_names.dart';
import '../../../../data/disease_info/treatment_logic.dart'; // Data Logic

class DiseaseResultScreen extends StatelessWidget {
  const DiseaseResultScreen({super.key});

  // NOTE: All logic methods (getSeverityFromLabel, getTreatmentSteps, etc.)
  // have been removed from this class and moved to TreatmentLogic.dart.

  @override
  Widget build(BuildContext context) {
    // Use the Sizer helper
    final sizer = ResponsiveSizer(context);

    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String label = data["label"];
    final double confidence = data["confidence"];

    // Access the static logic directly from the Data layer
    final severity = TreatmentLogic.getSeverityFromLabel(label);
    final severityColor = TreatmentLogic.getSeverityColor(severity);
    final treatmentSteps = TreatmentLogic.getTreatmentSteps(label);

    final spacing = sizer.spacingS * 1.5;
    final buttonHeight = sizer.h(0.065);
    final titleFont = sizer.fontTitle;
    final textFont = sizer.fontText;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        // Use the reusable AppBarTitle widget
        title: const AppBarTitle(title: "Disease Result"),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(sizer.w(0.04)),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizer.w(0.03))),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(sizer.w(0.04)),
                  child: ListView(
                    // Changed Column to ListView for scrollability
                    children: [
                      Text(label.replaceAll('_', ' '),
                          style: TextStyle(
                              fontSize: titleFont,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff284C29))),
                      SizedBox(height: spacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Confidence",
                              style: TextStyle(color: Color(0xff1E3B1F))),
                          Text("${confidence.toStringAsFixed(1)}%"),
                        ],
                      ),
                      SizedBox(height: spacing / 3),
                      LinearProgressIndicator(
                          value: confidence / 100,
                          color: const Color(0xff387939),
                          backgroundColor: Colors.grey[300],
                          minHeight: spacing / 2),
                      SizedBox(height: spacing),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Low"),
                            Text("Medium"),
                            Text("High")
                          ]),
                      SizedBox(height: spacing / 3),
                      const Text("Severity",
                          style: TextStyle(color: Color(0xff1E3B1F))),
                      SizedBox(height: spacing / 3),
                      SizedBox(
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: severity == "Low"
                              ? 0.33
                              : severity == "Moderate"
                                  ? 0.66
                                  : 1.0,
                          color: severityColor,
                          backgroundColor: Colors.grey[300],
                          minHeight: spacing / 2,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text("Treatment Recommendations",
                          style: TextStyle(
                              fontSize: textFont,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff284C29))),
                      SizedBox(height: spacing / 2),
                      ...treatmentSteps.asMap().entries.map((entry) {
                        int idx = entry.key + 1;
                        String step = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: spacing / 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: sizer.w(0.03),
                                backgroundColor: const Color(0xffDCF0DC),
                                child: Text("$idx",
                                    style: TextStyle(
                                        color: const Color(0xff284C29),
                                        fontWeight: FontWeight.bold,
                                        fontSize: textFont * 0.6)),
                              ),
                              SizedBox(width: sizer.w(0.02)),
                              Expanded(
                                  child: Text(step,
                                      style: TextStyle(
                                          fontSize: textFont,
                                          color: const Color(0xff374151)))),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: sizer.spacingM),
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                label: const Text("Scan Again",
                    style: TextStyle(color: Colors.white)),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteNames.home),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff387939),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sizer.w(0.03)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
