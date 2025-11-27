// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/data/api/api_service.dart' as _i411;
import 'package:news_app/data/data_source/articles_data_source/articles_api_data_source.dart'
    as _i566;
import 'package:news_app/data/data_source/articles_data_source/articles_data_source.dart'
    as _i486;
import 'package:news_app/data/data_source/sources_data_source/sources_api_data_source.dart'
    as _i845;
import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart'
    as _i604;
import 'package:news_app/data/repo_impl/articles_repo_impl.dart' as _i990;
import 'package:news_app/data/repo_impl/sources_repo_impl.dart' as _i650;
import 'package:news_app/features/home_screen/provider/articles_provider.dart'
    as _i746;
import 'package:news_app/features/home_screen/provider/sources_provider.dart'
    as _i731;
import 'package:news_app/repos/articles_repo.dart' as _i618;
import 'package:news_app/repos/sources_repo.dart' as _i735;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i411.ApiService>(() => _i411.ApiService());
    gh.singleton<_i604.SourcesDataSource>(
      () => _i845.SourcesApiDataSource(apiService: gh<_i411.ApiService>()),
    );
    gh.singleton<_i486.ArticlesDataSource>(
      () => _i566.ArticlesApiDataSource(apiService: gh<_i411.ApiService>()),
    );
    gh.singleton<_i735.SourcesRepo>(
      () => _i650.SourcesRepoImpl(
        sourcesDataSource: gh<_i604.SourcesDataSource>(),
      ),
    );
    gh.singleton<_i731.SourcesProvider>(
      () => _i731.SourcesProvider(sourcesRepo: gh<_i735.SourcesRepo>()),
    );
    gh.singleton<_i618.ArticlesRepo>(
      () => _i990.ArticlesRepoImpl(
        articlesDataSource: gh<_i486.ArticlesDataSource>(),
      ),
    );
    gh.singleton<_i746.ArticlesProvider>(
      () => _i746.ArticlesProvider(articlesRepo: gh<_i618.ArticlesRepo>()),
    );
    return this;
  }
}
