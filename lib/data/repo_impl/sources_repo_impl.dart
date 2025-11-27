import 'package:dartz/dartz.dart';

import 'package:news_app/core/models/category_model.dart';

import 'package:news_app/core/models/sources_response/SourcesResponse.dart';

import '../../repos/sources_repo.dart';
import '../data_source/sources_data_source/sources_data_source.dart';


class SourcesRepoImpl implements SourcesRepo{
  SourcesDataSource sourcesDataSource;
  SourcesRepoImpl({required this.sourcesDataSource});
  @override
  Future<Either<SourcesResponse, String>> getSources(CategoryModel category) {
    return sourcesDataSource.getSources(category);
  }
  
}