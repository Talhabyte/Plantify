import 'package:flutter/material.dart';

class DiseaseResultScreen extends StatelessWidget {
  const DiseaseResultScreen({super.key});

  String getSeverityFromLabel(String label) {
    final lowerLabel = label.toLowerCase().trim();

    const lowSeverity = [
      "apple___healthy",
      "blueberry___healthy",
      "cherry_(including_sour)___healthy",
      "corn_(maize)___healthy",
      "grape___healthy",
      "peach___healthy",
      "pepper,_bell___healthy",
      "potato___healthy",
      "raspberry___healthy",
      "strawberry___healthy",
      "tomato___healthy",
      "soybean___healthy",
    ];

    const highSeverity = [
      "apple___black_rot",
      "orange___haunglongbing_(citrus_greening)",
      "tomato___target_spot",
      "tomato___tomato_yellow_leaf_curl_virus",
      "tomato___tomato_mosaic_virus",
      "grape___black_rot",
      "grape___esca_(black_measles)",
      "tomato___late_blight",
      "potato___late_blight",
    ];

    const moderateSeverity = [
      "apple___apple_scab",
      "apple___cedar_apple_rust",
      "cherry_(including_sour)___powdery_mildew",
      "squash___powdery_mildew",
      "corn_(maize)___cercospora_leaf_spot gray_leaf_spot",
      "corn_(maize)___common_rust_",
      "corn_(maize)___northern_leaf_blight",
      "grape___leaf_blight_(isariopsis_leaf_spot)",
      "peach___bacterial_spot",
      "pepper,_bell___bacterial_spot",
      "potato___early_blight",
      "strawberry___leaf_scorch",
      "tomato___bacterial_spot",
      "tomato___early_blight",
      "tomato___leaf_mold",
      "tomato___septoria_leaf_spot",
      "tomato___spider_mites two-spotted_spider_mite",
    ];

    if (lowSeverity.map((e) => e.toLowerCase()).contains(lowerLabel))
      return "Low";
    if (moderateSeverity.map((e) => e.toLowerCase()).contains(lowerLabel))
      return "Moderate";
    if (highSeverity.map((e) => e.toLowerCase()).contains(lowerLabel))
      return "High";

    return "Moderate";
  }

  Color getSeverityColor(String severity) {
    switch (severity) {
      case "Low":
        return Colors.green;
      case "Moderate":
        return Colors.orange;
      case "High":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  List<String> getTreatmentSteps(String label) {
    final normalizedLabel = label.toLowerCase().trim();
    switch (normalizedLabel) {
      case "apple___apple_scab":
        return [
          "Apply sulfur or copper-based fungicide",
          "Prune affected leaves and branches",
          "Remove fallen debris around the tree"
        ];
      case "apple___black_rot":
        return [
          "Remove and destroy infected fruits and leaves",
          "Apply fungicide spray during early growth",
          "Prune trees to improve sunlight and air circulation"
        ];
      case "apple___cedar_apple_rust":
        return [
          "Apply fungicide regularly",
          "Remove nearby juniper trees if possible",
          "Prune infected leaves and fruit"
        ];
      case "apple___healthy":
        return [
          "Maintain regular watering and fertilization",
          "Inspect for early signs of disease",
          "Keep area clean from fallen debris"
        ];
      case "blueberry___healthy":
        return [
          "Continue regular watering and fertilization",
          "Mulch to retain soil moisture",
          "Prune to improve airflow and sunlight"
        ];
      case "cherry_(including_sour)___powdery_mildew":
      case "squash___powdery_mildew":
        return [
          "Apply fungicide with potassium bicarbonate",
          "Improve air circulation around plants",
          "Remove and destroy infected leaves"
        ];
      case "cherry_(including_sour)___healthy":
        return [
          "Maintain good watering practices",
          "Monitor for early signs of fungal infection",
          "Ensure proper sunlight and spacing"
        ];
      case "corn_(maize)___cercospora_leaf_spot gray_leaf_spot":
        return [
          "Apply fungicide early",
          "Use resistant varieties",
          "Remove plant debris to reduce infection"
        ];
      case "corn_(maize)___common_rust_":
        return [
          "Apply recommended fungicides",
          "Plant resistant maize varieties",
          "Avoid dense planting to improve airflow"
        ];
      case "corn_(maize)___northern_leaf_blight":
        return [
          "Use resistant maize varieties",
          "Apply fungicides if early symptoms appear",
          "Rotate crops to prevent spread"
        ];
      case "corn_(maize)___healthy":
        return [
          "Regularly inspect plants",
          "Maintain proper irrigation and fertilization",
          "Keep field free from debris"
        ];
      case "grape___black_rot":
        return [
          "Remove infected fruit and leaves",
          "Apply fungicide regularly",
          "Prune to improve airflow and sunlight"
        ];
      case "grape___esca_(black_measles)":
        return [
          "Remove severely infected wood",
          "Apply fungicide sprays",
          "Avoid wounding vines during pruning"
        ];
      case "grape___leaf_blight_(isariopsis_leaf_spot)":
        return [
          "Remove affected leaves",
          "Apply fungicides",
          "Ensure proper spacing and airflow"
        ];
      case "grape___healthy":
        return [
          "Maintain regular irrigation",
          "Monitor for signs of pests or disease",
          "Prune and clean debris regularly"
        ];
      case "orange___haunglongbing_(citrus_greening)":
        return [
          "Remove infected trees immediately",
          "Control psyllid insect vector",
          "Use disease-free nursery stock"
        ];
      case "peach___bacterial_spot":
        return [
          "Remove and destroy infected leaves",
          "Apply copper-based bactericide",
          "Avoid overhead watering to reduce spread"
        ];
      case "peach___healthy":
        return [
          "Maintain regular care",
          "Monitor for early signs of infection",
          "Prune to improve airflow and sunlight"
        ];
      case "pepper,_bell___bacterial_spot":
        return [
          "Remove infected leaves and fruit",
          "Apply copper sprays",
          "Avoid working on plants when wet"
        ];
      case "pepper,_bell___healthy":
        return [
          "Regular watering and fertilization",
          "Monitor for pests or disease",
          "Maintain good plant spacing"
        ];
      case "potato___early_blight":
        return [
          "Apply fungicides promptly",
          "Remove infected leaves",
          "Ensure proper spacing for airflow"
        ];
      case "potato___late_blight":
        return [
          "Use fungicides recommended for late blight",
          "Remove and destroy infected plants",
          "Avoid overhead watering"
        ];
      case "potato___healthy":
        return [
          "Maintain proper watering and nutrition",
          "Inspect for early disease symptoms",
          "Keep field clean from debris"
        ];
      case "raspberry___healthy":
        return [
          "Water and fertilize regularly",
          "Monitor for pests and disease",
          "Prune to improve airflow"
        ];
      case "strawberry___leaf_scorch":
        return [
          "Remove affected leaves",
          "Apply fungicides",
          "Avoid overhead watering"
        ];
      case "strawberry___healthy":
        return [
          "Maintain good irrigation and fertilization",
          "Inspect for early signs of pests",
          "Keep the bed clean and weed-free"
        ];
      case "tomato___bacterial_spot":
        return [
          "Remove infected leaves",
          "Apply copper-based bactericide",
          "Avoid working on wet plants"
        ];
      case "tomato___early_blight":
        return [
          "Apply fungicides early",
          "Remove infected leaves",
          "Mulch to prevent soil splash"
        ];
      case "tomato___late_blight":
        return [
          "Use resistant varieties",
          "Apply fungicides promptly",
          "Remove infected plants"
        ];
      case "tomato___leaf_mold":
        return [
          "Remove infected leaves",
          "Apply fungicides",
          "Improve airflow in greenhouse or garden"
        ];
      case "tomato___septoria_leaf_spot":
        return [
          "Remove affected leaves",
          "Apply fungicide",
          "Practice crop rotation"
        ];
      case "tomato___spider_mites two-spotted_spider_mite":
        return [
          "Spray insecticidal soap or neem oil",
          "Increase humidity around plants",
          "Remove heavily infested leaves"
        ];
      case "tomato___target_spot":
        return [
          "Apply fungicides",
          "Remove infected plant parts",
          "Ensure good spacing and airflow"
        ];
      case "tomato___tomato_yellow_leaf_curl_virus":
        return [
          "Remove infected plants immediately",
          "Control whitefly vector",
          "Use virus-free seedlings"
        ];
      case "tomato___tomato_mosaic_virus":
        return [
          "Remove and destroy infected plants",
          "Disinfect tools after handling infected plants",
          "Use resistant varieties and rotate crops"
        ];
      case "tomato___healthy":
        return [
          "Maintain regular watering and fertilization",
          "Inspect plants for early signs of disease",
          "Keep the area clean from debris"
        ];
      case "soybean___healthy": // ✅ ADD THIS
        return [
          "Maintain proper watering and nutrition",
          "Inspect for pests and disease regularly",
          "Keep the field clean and remove weeds"
        ];
      default:
        // ... (same as your previous getTreatmentSteps mapping)
        return [
          "Follow general care: improve ventilation and avoid overwatering",
          "Inspect plants regularly",
          "Keep tools and surroundings clean"
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String label = data["label"];
    final double confidence = data["confidence"];

    final severity = getSeverityFromLabel(label);
    final severityColor = getSeverityColor(severity);
    final treatmentSteps = getTreatmentSteps(label);

    final size = MediaQuery.of(context).size;
    final titleFont = size.width * 0.055;
    final textFont = size.width * 0.045;
    final spacing = size.height * 0.015;
    final buttonHeight = size.height * 0.065;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.eco_outlined,
              size: size.width * 0.1, color: const Color(0xff387939)),
          SizedBox(width: size.width * 0.02),
          Text("Disease Result",
              style: TextStyle(
                  color: const Color(0xff284C29), fontSize: titleFont)),
        ]),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.03)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text("Severity",
                        style: const TextStyle(color: Color(0xff1E3B1F))),
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
                              radius: size.width * 0.03,
                              backgroundColor: const Color(0xffDCF0DC),
                              child: Text("$idx",
                                  style: TextStyle(
                                      color: const Color(0xff284C29),
                                      fontWeight: FontWeight.bold,
                                      fontSize: textFont * 0.6)),
                            ),
                            SizedBox(width: size.width * 0.02),
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
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                label: const Text("Scan Again",
                    style: TextStyle(color: Colors.white)),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff387939),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.03))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
