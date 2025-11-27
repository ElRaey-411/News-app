import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repos/sources_repo.dart';
import '../../../core/models/category_model.dart';
import '../../../core/models/sources_response/Sources.dart';
@singleton
class SourcesProvider extends ChangeNotifier{
  SourcesRepo sourcesRepo;
  SourcesProvider({required this.sourcesRepo});
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  int selectedSource =0;


 Future<void> loadSources(int selectedCategory) async {
    isLoading = true;
    notifyListeners();
    var response = await sourcesRepo.getSources(
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

  void changeSource(int index) {
    selectedSource = index;
    notifyListeners();
  }
}