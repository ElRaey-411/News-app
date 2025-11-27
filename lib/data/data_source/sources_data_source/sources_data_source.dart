import 'package:dartz/dartz.dart';

import '../../../core/models/category_model.dart';
import '../../../core/models/sources_response/SourcesResponse.dart';

abstract class SourcesDataSource{
  Future<Either<SourcesResponse, String>> getSources(CategoryModel category);

}