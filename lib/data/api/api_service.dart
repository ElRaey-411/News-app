import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/core/models/articles_response/ArticlesResponse.dart';
import '../../core/models/articles_response/Article.dart';
import '../../core/models/category_model.dart';
import '../../core/models/sources_response/Sources.dart';
import '../../core/models/sources_response/SourcesResponse.dart';
import '../../core/resources/const_manager.dart';
@singleton
class ApiService {
   Future<Either<SourcesResponse, String>> getSources(
    CategoryModel category,
  ) async {
    Uri url = Uri.https(ConstManager.baseUrl, ConstManager.sourcesEndPoint, {
      "apiKey": ConstManager.apiKey,
      "category": category.name,
    });
    try {
      var serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse response = SourcesResponse.fromJson(json);
      if (response.status == "ok") {
        return left(response);
      } else {
        return right(response.message ?? "");
      }
    } catch (e) {
      if (e is SocketException) {
        return right("No internet connection");
      } else if (e is HttpException) {
        return right("Couldn't connect to server");
      } else {
        return right("Something went wrong");
      }
    }
  }

  Future<Either<List<Article>, String>> getArticles(
    Source source, [
    String? searchKey,
  ]) async {
    Map<String, dynamic> params = {
      ConstManager.apiKeyJson: ConstManager.apiKey,
      ConstManager.sourcesJson: source.id,
      if (searchKey != null) ConstManager.queryJson: searchKey,
    };
    Uri url = Uri.https(
      ConstManager.baseUrl,
      ConstManager.articlesEndPoint,
      params,
    );
    try {
      var serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse response = ArticlesResponse.fromJson(json);
      if (response.status == "ok") {
        return left(response.articles??[]);
      } else {
        return right(response.message ?? "");
      }
    } catch (e) {
      if (e is SocketException) {
        return right("No internet connection");
      } else if (e is HttpException) {
        return right("Couldn't connect to server");
      } else {
        return right("Something went wrong");
      }
    }
  }
}
