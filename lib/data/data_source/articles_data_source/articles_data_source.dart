import 'package:dartz/dartz.dart';

import '../../../core/models/articles_response/Article.dart';
import '../../../core/models/sources_response/Sources.dart';

abstract class ArticlesDataSource {
  Future<Either<List<Article>, String>> getArticles(
    Source source, [
    String? searchKey,
  ]);
}
