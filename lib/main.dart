import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. Import Core/Utils
import 'core/utils/route_names.dart';

// 2. Import Feature Screens (Views)
import 'features/onboarding/splash_screen.dart';
import 'features/onboarding/welcome_screen.dart';
import 'features/analysis/home_screen.dart';
import 'features/guide/disease_guide_screen.dart';
import 'features/analysis/disease_result_screen.dart';

// 3. Import Feature ViewModels (Providers)
import 'features/analysis/providers/analysis_viewmodel.dart';
import 'features/guide/providers/guide_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PlantifyApp());
}

class PlantifyApp extends StatelessWidget {
  const PlantifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the entire application in a MultiProvider
    return MultiProvider(
      providers: [
        // The AnalysisViewModel is created only once (lazy: true by default)
        // and manages the state for the HomeScreen.
        ChangeNotifierProvider(create: (_) => AnalysisViewModel()),

        // The GuideViewModel manages state (search query) for the DiseaseGuideScreen.
        ChangeNotifierProvider(create: (_) => GuideViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Plantify",
        theme: ThemeData(primarySwatch: Colors.green),

        // Use RouteNames for initial route
        initialRoute: RouteNames.splash,

        // Define routes using RouteNames constants
        routes: {
          RouteNames.splash: (_) => const SplashScreen(),
          RouteNames.welcome: (_) => const WelcomeScreen(),

          // NOTE: The HomeScreen (formerly HomePage) is now a clean StatelessWidget.
          // It relies on the AnalysisViewModel provided above.
          RouteNames.home: (_) => const HomeScreen(),

          RouteNames.guide: (_) => const DiseaseGuideScreen(),
          RouteNames.result: (_) => const DiseaseResultScreen(),
        },
      ),
    );
  }
}

// NOTE: The original 'HomePage' class has been completely removed from main.dart
// and moved/refactored into lib/features/analysis/home_screen.dart.
