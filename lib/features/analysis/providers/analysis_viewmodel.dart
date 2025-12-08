import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/ml_model/tflite_helper.dart';
import '../../../../core/utils/route_names.dart';

class AnalysisViewModel extends ChangeNotifier {
  final TFLiteHelper _tflite = TFLiteHelper();
  final ImagePicker _picker = ImagePicker();

  File? _selectedImage;
  bool _isLoading = false;
  String? _predictedLabel;
  double? _confidence;

  // Getters for the View (HomeScreen)
  File? get selectedImage => _selectedImage;
  bool get isLoading => _isLoading;
  String? get predictedLabel => _predictedLabel;
  double? get confidence => _confidence;

  // ---------------------------
  // Lifecycle & Initialization
  // ---------------------------
  AnalysisViewModel() {
    _tflite.loadModel();
  }

  @override
  void dispose() {
    _tflite.dispose();
    super.dispose();
  }

  // ---------------------------
  // User Actions (Image Picking)
  // ---------------------------
  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;

    _selectedImage = File(image.path);
    _predictedLabel = null;
    _confidence = null;
    notifyListeners();

    await _runModel(context);
  }

  // ---------------------------
  // Business Logic (ML Prediction)
  // ---------------------------
  Future<void> _runModel(BuildContext context) async {
    if (_selectedImage == null) return;

    _isLoading = true;
    notifyListeners();

    final result = await _tflite.predict(_selectedImage!);

    _isLoading = false;
    _predictedLabel = result["label"] as String?;
    _confidence = (result["confidence"] as double?) ?? 0.0;

    if (_predictedLabel == null || result.containsKey("error")) {
      _predictedLabel = "Error: ${result["error"]}";
      _confidence = 0.0;
    }
    notifyListeners();

    if (_predictedLabel != null) {
      // Navigate to the result screen upon successful prediction
      Navigator.pushNamed(
        context,
        RouteNames.result,
        arguments: {"label": _predictedLabel, "confidence": _confidence},
      );
    }
  }
}
