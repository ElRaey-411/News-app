import 'package:dartz/dartz.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/models/sources_response/SourcesResponse.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart';

class SourcesApiDataSource implements SourcesDataSource{
  ApiService apiService;
  SourcesApiDataSource({required this.apiService});
  @override
  Future<Either<SourcesResponse, String>> getSources(CategoryModel category) {
   return apiService.getSources(category);
  }
  
}