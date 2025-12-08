import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';

class TreatmentLogic {
  // Private constructor to make this class static utility
  TreatmentLogic._();

  static String getSeverityFromLabel(String label) {
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

    if (lowSeverity.map((e) => e.toLowerCase()).contains(lowerLabel)) {
      return "Low";
    }
    if (moderateSeverity.map((e) => e.toLowerCase()).contains(lowerLabel)) {
      return "Moderate";
    }
    if (highSeverity.map((e) => e.toLowerCase()).contains(lowerLabel)) {
      return "High";
    }

    return "Moderate";
  }

  static Color getSeverityColor(String severity) {
    switch (severity) {
      case "Low":
        return AppColors.severityLow;
      case "Moderate":
        return AppColors.severityModerate;
      case "High":
        return AppColors.severityHigh;
      default:
        return Colors.grey;
    }
  }

  static List<String> getTreatmentSteps(String label) {
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
      case "soybean___healthy":
        return [
          "Maintain proper watering and nutrition",
          "Inspect for pests and disease regularly",
          "Keep the field clean and remove weeds"
        ];
      default:
        return [
          "Follow general care: improve ventilation and avoid overwatering",
          "Inspect plants regularly",
          "Keep tools and surroundings clean"
        ];
    }
  }
}
