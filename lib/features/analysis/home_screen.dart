import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// Import the ViewModel and Core Components
import 'package:provider/provider.dart';
import '../../../../core/widgets/app_bar_title.dart';
import '../../../../core/widgets/responsive_sizer.dart';
import 'providers/analysis_viewmodel.dart'; // ViewModel

// This is now the clean View (Stateless or StatefulWidget that only handles UI)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We use a Builder here to get a fresh context for Sizer
    final sizer = ResponsiveSizer(context);

    // Watch the ViewModel for state changes
    final viewModel = context.watch<AnalysisViewModel>();

    final iconSize = sizer.iconLarge;
    // Set button height to match the desired size
    final buttonHeight = sizer.h(0.065);
    // Set button width to match the desired size (42% of screen width)
    final buttonWidth = sizer.w(0.42);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Use the reusable AppBarTitle widget
        title: const AppBarTitle(title: "Scan Leaf"),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(sizer.w(0.04)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(sizer.w(0.03)),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                // Display selected image or placeholder
                child: viewModel.selectedImage == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_outlined,
                                size: iconSize, color: const Color(0xff65B365)),
                            SizedBox(height: sizer.spacingS),
                            Text(
                              "Camera Preview would Appear here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sizer.fontText),
                            ),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(sizer.w(0.03)),
                        child: Image.file(viewModel.selectedImage!,
                            fit: BoxFit.cover),
                      ),
              ),
            ),
            SizedBox(height: sizer.spacingM),

            // Display loading or prediction results
            viewModel.isLoading
                ? const CircularProgressIndicator(strokeWidth: 3)
                : viewModel.predictedLabel != null && !viewModel.isLoading
                    ? Column(
                        children: [
                          Text(viewModel.predictedLabel!.replaceAll('_', ' '),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: sizer.fontTitle,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: sizer.spacingS),
                          Text(
                            "Confidence: ${viewModel.confidence!.toStringAsFixed(2)}%",
                            style: TextStyle(
                                fontSize: sizer.fontText, color: Colors.grey),
                          ),
                        ],
                      )
                    : Container(),
            SizedBox(height: sizer.spacingM),

            // Image Picking Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 1. Capture Image Button (Primary Green)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff387939),
                    minimumSize: Size(buttonWidth, buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizer.w(0.03)),
                    ),
                  ),
                  onPressed: () =>
                      viewModel.pickImage(context, ImageSource.camera),
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text("Capture Image",
                      style: TextStyle(color: Colors.white)),
                ),

                // 2. Upload Image Button (White Background, Green Border/Text)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(
                        buttonWidth, buttonHeight), // Use buttonHeight here
                    side:
                        const BorderSide(color: Color(0xff2F6030), width: 1.5),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizer.w(0.03)),
                    ),
                  ),
                  onPressed: () =>
                      viewModel.pickImage(context, ImageSource.gallery),
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
