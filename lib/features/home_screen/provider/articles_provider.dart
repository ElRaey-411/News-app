import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/models/articles_response/Article.dart';
import '../../../core/models/sources_response/Sources.dart';
import '../../../repos/articles_repo.dart';
@singleton
class ArticlesProvider extends ChangeNotifier {
  ArticlesRepo articlesRepo;
  ArticlesProvider({required this.articlesRepo});
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  String? search ;

  void loadArticles(Source source, [String? searchKey]) async {
    isLoading = true;
    notifyListeners();
    var response = await articlesRepo.getArticles(source,searchKey);

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
