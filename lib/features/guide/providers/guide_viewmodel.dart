import 'package:flutter/material.dart';
import '../../../../data/disease_info/disease_data.dart';
import '../../../../data/models/disease_model.dart';

class GuideViewModel extends ChangeNotifier {
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  // Exposes the filtered list to the View
  List<Disease> get filteredDiseaseList {
    if (_searchQuery.isEmpty) {
      return DiseaseData.diseaseGuideList;
    }
    return DiseaseData.diseaseGuideList.where((disease) {
      return disease.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  // Action: Updates the search query and notifies the UI
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
