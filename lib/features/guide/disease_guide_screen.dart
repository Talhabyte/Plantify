import 'package:flutter/material.dart';
// Import Core Components and ViewModel
import 'package:provider/provider.dart';
import '../../../../core/widgets/app_bar_title.dart';
import '../../../../core/widgets/responsive_sizer.dart';
import '../../../../data/models/disease_model.dart';
import 'providers/guide_viewmodel.dart';

// The screen is now StatelessWidget (or StatefulWidget only for basic UI state)
class DiseaseGuideScreen extends StatelessWidget {
  const DiseaseGuideScreen({super.key});

  // NOTE: The 'diseaseCards' list and search logic are now in the Data and ViewModel layers.
  // The stateful part is gone, replaced by Provider consumption.

  @override
  Widget build(BuildContext context) {
    // Use the Sizer helper
    final sizer = ResponsiveSizer(context);
    // Watch the ViewModel for state changes (search query changes)
    final viewModel = context.watch<GuideViewModel>();

    final textFont = sizer.fontText;
    final searchFont = sizer.fontText;
    final cardHeight = sizer.h(0.12);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Use the reusable AppBarTitle widget
        title: const AppBarTitle(title: "Disease Guide"),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          // 🔍 SEARCH BAR - Calls ViewModel method
          Padding(
            padding: EdgeInsets.all(sizer.w(0.03)),
            child: TextField(
              onChanged: (value) => viewModel.updateSearchQuery(value),
              decoration: InputDecoration(
                hintText: "Search diseases...",
                hintStyle: TextStyle(fontSize: searchFont),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF284C29)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sizer.w(0.03)),
                  borderSide: const BorderSide(
                    color: Color(0xFF284C29),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sizer.w(0.03)),
                  borderSide: const BorderSide(
                    color: Color(0xFF284C29),
                    width: 2.5,
                  ),
                ),
              ),
              style: TextStyle(fontSize: searchFont),
            ),
          ),

          // LIST VIEW - Reads filtered list from ViewModel
          Expanded(
            child: ListView(
              children: viewModel.filteredDiseaseList
                  .map((disease) =>
                      _diseaseCard(disease, cardHeight, textFont, sizer))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ⭐ REUSABLE DISEASE CARD - Modified to accept the Disease Model
  Widget _diseaseCard(Disease disease, double cardHeight, double textFont,
      ResponsiveSizer sizer) {
    return Padding(
      key: ValueKey(disease.name),
      padding: EdgeInsets.symmetric(
          horizontal: cardHeight * 0.2, vertical: cardHeight * 0.1),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardHeight * 0.2)),
        elevation: 3,
        child: ListTile(
          contentPadding: EdgeInsets.all(cardHeight * 0.1),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(cardHeight * 0.15),
            child: Image.asset(disease.imageAssetPath,
                height: cardHeight, width: cardHeight, fit: BoxFit.cover),
          ),
          title: Text(disease.name,
              style: TextStyle(
                  color: const Color(0xFF284C29),
                  fontSize: textFont,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(disease.description,
              style: TextStyle(fontSize: textFont * 0.85)),
        ),
      ),
    );
  }
}
