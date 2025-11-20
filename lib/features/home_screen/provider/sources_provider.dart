import 'package:flutter/widgets.dart';

import '../../../config/api/api_service.dart';
import '../../../core/models/category_model.dart';
import '../../../core/models/sources_response/Sources.dart';

class SourcesProvider extends ChangeNotifier{
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

 Future<void> loadSources(int selectedCategory) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService.getSources(
      CategoryModel.categories[selectedCategory],
    );
    response.fold((sourcesResponse) {
      sources = sourcesResponse.sources!;
      isLoading = false;
      notifyListeners();
    }, (error) {
      errorMessage = error;
      isLoading = false;
      notifyListeners();
    });
  }
}