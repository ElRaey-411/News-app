import 'package:flutter/foundation.dart';
import 'package:news_app/config/api/api_service.dart';

import '../../../core/models/articles_response/Article.dart';
import '../../../core/models/sources_response/Sources.dart';

class ArticlesProvider extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  String? search ;

  void loadArticles(Source source, [String? searchKey]) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService.getArticles(source,searchKey);

    response.fold(
      (articlesResponse) {
        articles = articlesResponse;
        isLoading = false;
        notifyListeners();
      },
      (error) {
        errorMessage = error;
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
