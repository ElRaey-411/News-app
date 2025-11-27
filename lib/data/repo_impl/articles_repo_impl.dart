import 'package:dartz/dartz.dart';

import 'package:news_app/core/models/articles_response/Article.dart';

import 'package:news_app/core/models/sources_response/Sources.dart';

import '../../repos/articles_repo.dart';
import '../data_source/articles_data_source/articles_data_source.dart';

class ArticlesRepoImpl implements ArticlesRepo{

  ArticlesRepoImpl({required this.articlesDataSource});
  ArticlesDataSource articlesDataSource;

  @override
  Future<Either<List<Article>, String>> getArticles(Source source, [String? searchKey]) {
   return articlesDataSource.getArticles(source, searchKey);

  }

}