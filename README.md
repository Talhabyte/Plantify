# 🌿 Plantify | AI-Powered Plant Health Analyzer

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

Plantify is a mobile application designed to bridge the gap between technology and nature. Using Machine Learning, the app identifies plant species and diagnoses diseases from a simple camera snapshot, providing actionable care insights to users.

---

## 🚀 Key Features

* **Real-time Identification:** Instant plant species recognition using on-device/API-based AI models.
* **Health Diagnosis:** Detects leaf patterns to identify common diseases (Pests, Fungi, Nutrient deficiency).
* **Camera Integration:** High-resolution image capture and gallery picking capabilities.
* **Interactive UI:** A clean, modern aesthetic designed for garden enthusiasts.

## 🛠 Tech Stack & Tools

- **Framework:** Flutter (Channel Stable)
- **Language:** Dart
- **AI/ML:**  TFLite 
- **State Management:**  Provider 
- **Storage:**  Firebase
- **Image Processing:** `image_picker`, `image_cropper`

## 📦 Architecture Overview

The project follows a **Layered Architecture** to ensure code readability and future scalability:

1.  **Presentation Layer:** Custom widgets and screens designed for responsiveness.
2.  **Service Layer:** Handles the heavy lifting of AI processing and Image picking.
3.  **Data Layer:** Manages model assets and local user data.

---

---

## ⚙️ Installation & Setup

 1. **Clone the repo:**
   git clone [https://github.com/Talhabyte/Plantify.git](https://github.com/Talhabyte/Plantify.git)

 2  Install dependencies:
   flutter pub get
 3  #Make sure an emulator or physical device is connected
flutter run
