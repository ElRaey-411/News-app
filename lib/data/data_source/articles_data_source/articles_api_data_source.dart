import 'package:dartz/dartz.dart';

import 'package:news_app/core/models/articles_response/Article.dart';

import 'package:news_app/core/models/sources_response/Sources.dart';

import '../../api/api_service.dart';
import 'articles_data_source.dart';

class ArticlesApiDataSource implements ArticlesDataSource {
  ApiService apiService;
  ArticlesApiDataSource({required this.apiService});

  @override
  Future<Either<List<Article>, String>> getArticles(Source source, [String? searchKey]) {
   return apiService.getArticles(source, searchKey);
  }

}