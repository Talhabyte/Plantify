import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class TFLiteHelper {
  tfl.Interpreter? _interpreter;
  List<String> labels = [];

  static const int INPUT_SIZE = 128; // Your model's input size

  // ---------------------------
  // LOAD MODEL & LABELS
  // ---------------------------
  Future<void> loadModel() async {
    try {
      _interpreter = await tfl.Interpreter.fromAsset(
        'assets/models/plant_model_quant.tflite',
        options: tfl.InterpreterOptions()..threads = 2,
      );

      final labelsData =
          await rootBundle.loadString('assets/models/labels.txt');
      labels =
          labelsData.split('\n').where((s) => s.trim().isNotEmpty).toList();

      print('Model & labels loaded successfully.');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  void dispose() {
    _interpreter?.close();
  }

  // ---------------------------
  // PREPROCESS IMAGE (Fixed image conversion and RangeError)
  // ---------------------------
  List<List<List<List<double>>>> preprocess(File imageFile) {
    final rawImage = imageFile.readAsBytesSync();
    img.Image? decodedImage = img.decodeImage(rawImage);

    if (decodedImage == null) {
      throw Exception('Could not decode image.');
    }

    // Resize to 128x128
    img.Image imageResized =
        img.copyResize(decodedImage, width: 128, height: 128);

    // 4D input tensor [1, height, width, channels]
    final input = List.generate(
      1,
      (_) => List.generate(
        128,
        (_) => List.generate(
          128,
          (_) => List.filled(3, 0.0),
        ),
      ),
    );

    for (int y = 0; y < 128; y++) {
      for (int x = 0; x < 128; x++) {
        final pixel = imageResized.getPixel(x, y); // Pixel object

        input[0][y][x][0] = pixel.r / 255.0; // Red
        input[0][y][x][1] = pixel.g / 255.0; // Green
        input[0][y][x][2] = pixel.b / 255.0; // Blue
      }
    }

    return input;
  }

  // ---------------------------
  // RUN PREDICTION (Fixed Type Constant)
  // ---------------------------
  Future<Map<String, dynamic>> predict(File imageFile) async {
    if (_interpreter == null) {
      return {"error": "Interpreter not loaded"};
    }
    if (labels.isEmpty) {
      return {"error": "Labels not loaded"};
    }

    var inputTensor = _interpreter!.getInputTensor(0);

    // *** FIX: Use all lowercase float32, which is the standard for 0.12.1 ***
    //  if (inputTensor.type != tfl.TfLiteType.float32) {
    //  print(
    //    'Model requires input type ${inputTensor.type}, but Float32 is provided.');
    // return {"error": "Input Type Mismatch: Expected ${inputTensor.type}."};
    //}

    // Prepare input (returns List<List<...>> of double)
    final input = preprocess(imageFile);

    // Prepare output buffer
    var outputTensor = _interpreter!.getOutputTensor(0);
    var outputShape = outputTensor.shape; // [1, num_classes]

    // Use a List of doubles for output
    var output = List.filled(
      outputShape.reduce((a, b) => a * b),
      0.0,
    ).reshape(outputShape);

    // Run inference
    try {
      _interpreter!.run(input, output);
    } catch (e) {
      print('Interpreter error: $e');
      return {"error": "Model failed to run: $e"};
    }

    // Softmax probabilities list
    final List<double> outputList = output[0].cast<double>();

    // Get max probability
    // Now, process the list to get max probability.
    // We no longer need the .map().toList() part since outputList is already List<double>
    // and already contains the probabilities.

    // Get max probability
    final maxProb = outputList.reduce((a, b) => a > b ? a : b);
    final idx = outputList.indexOf(maxProb);

    // Final output
    return {
      "label": labels[idx],
      "confidence": maxProb * 100, // Return confidence as a percentage
      "raw": outputList,
    };
  }
}
