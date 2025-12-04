import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'tflite_helper.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'disease_guide_screen.dart';
import 'disease_result_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PlantifyApp());
}

class PlantifyApp extends StatelessWidget {
  const PlantifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plantify",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/home': (_) => const HomePage(),
        '/guide': (_) => const DiseaseGuideScreen(),
        '/result': (_) => const DiseaseResultScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  final TFLiteHelper tflite = TFLiteHelper();

  File? selectedImage;
  bool isLoading = false;
  String? predictedLabel;
  double? confidence;

  @override
  void initState() {
    super.initState();
    tflite.loadModel();
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
      predictedLabel = null;
      confidence = null;
    });

    await runModel();
  }

  Future<void> runModel() async {
    if (selectedImage == null) return;

    setState(() => isLoading = true);

    final result = await tflite.predict(selectedImage!);

    setState(() {
      isLoading = false;
      predictedLabel = result["label"] as String?;
      confidence = (result["confidence"] as double?) ?? 0.0;
      if (predictedLabel == null || result.containsKey("error")) {
        predictedLabel = "Error: ${result["error"]}";
        confidence = 0.0;
      }
    });

    if (predictedLabel != null) {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {"label": predictedLabel, "confidence": confidence},
      );
    }
  }

  @override
  void dispose() {
    tflite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.1;
    final fontSizeTitle = size.width * 0.055;
    final fontSizeText = size.width * 0.045;
    final buttonHeight = size.height * 0.065;
    final buttonWidth = size.width * 0.42;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.eco_outlined,
              size: iconSize, color: const Color(0xff387939)),
          SizedBox(width: size.width * 0.02),
          Text("Scan Leaf",
              style: TextStyle(
                  color: const Color(0xff284C29), fontSize: fontSizeTitle)),
        ]),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: selectedImage == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_outlined,
                                size: iconSize, color: const Color(0xff65B365)),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              "Camera Preview would Appear here",
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontSizeText),
                            ),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        child: Image.file(selectedImage!, fit: BoxFit.cover),
                      ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            isLoading
                ? CircularProgressIndicator(strokeWidth: 3)
                : predictedLabel != null
                    ? Column(
                        children: [
                          Text(predictedLabel!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: fontSizeTitle,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Confidence: ${confidence!.toStringAsFixed(2)}%",
                            style: TextStyle(
                                fontSize: fontSizeText, color: Colors.grey),
                          ),
                        ],
                      )
                    : Container(),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff387939),
                    minimumSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text("Capture Image",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(buttonWidth, buttonHeight),
                  ),
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.image, color: Color(0xff2F6030)),
                  label: const Text("Upload Image",
                      style: TextStyle(color: Color(0xff2F6030))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
