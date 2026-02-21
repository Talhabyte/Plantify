# Plantify 🌱

**AI Plant Health Analyzer Flutter App**

Plantify is a Flutter mobile app that helps users identify plant diseases by analyzing leaf images using a TensorFlow Lite model. It provides disease name, confidence level, severity, and treatment recommendations.

---

## **Features**

- Capture or upload leaf images
- Analyze leaves with a pre-trained TFLite model
- Display predicted disease label and confidence
- Show severity level and treatment recommendations
- Responsive UI with clean design
- State management using **Provider**

---

## **Screenshots**

![Splash Screen](assets/images/splash_bg.png)
![Home Screen](assets/images/welcome_bg.png)
![Disease Result](assets/images/powderymildew.jpeg)

---

## **Tech Stack**

- **Flutter** (Dart)
- **Provider** (State Management)
- **TFLite Flutter** (ML Inference)
- **Image Picker** (Capture/Upload Images)
- **Custom UI Widgets** for clean design

---

## **Getting Started**

### **Prerequisites**

- Flutter SDK >= 3.0.0
- Android/iOS device or emulator

### **Installation**

1. Clone the repository:


git clone https://github.com/Talhabyte/Plantify.git

2. Navigate to the project directory:

cd Plantify

3.Get dependencies:

flutter pub get

4.Run the app:

flutter run
Folder Structure:

lib/features - Feature modules (Home, Analysis, Guide)

lib/core - Utilities, constants, widgets

assets/models - TFLite model & labels

assets/images - UI images

Future Improvements:

Add support for multiple plant types

Implement batch analysis for multiple leaves

Add dark mode support

Integrate a community feature for sharing plant health tips
