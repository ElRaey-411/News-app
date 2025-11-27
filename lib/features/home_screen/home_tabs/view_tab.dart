import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/home_screen/provider/articles_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/models/articles_response/Article.dart';
import '../../../core/widgets/article_item.dart';
import '../../../data/api/api_service.dart';
import '../../../data/data_source/articles_data_source/articles_api_data_source.dart';
import '../../../data/data_source/sources_data_source/sources_api_data_source.dart';
import '../../../data/repo_impl/articles_repo_impl.dart';
import '../../../data/repo_impl/sources_repo_impl.dart';
import '../provider/home_provider.dart';
import '../provider/sources_provider.dart';

class ViewTab extends StatefulWidget {
  const ViewTab({super.key});

  @override
  State<ViewTab> createState() => _ViewTabState();
}

class _ViewTabState extends State<ViewTab> {
  late SourcesProvider sourcesProvider;
  late HomeProvider homeProvider;
  late ArticlesProvider articlesProvider;

  @override
  void initState() {
    super.initState();
    sourcesProvider = SourcesProvider(sourcesRepo: SourcesRepoImpl(
      sourcesDataSource: SourcesApiDataSource(apiService: ApiService()),
    )
    );
    articlesProvider = ArticlesProvider(
      articlesRepo: ArticlesRepoImpl(
        articlesDataSource: ArticlesApiDataSource(apiService: ApiService()),
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    homeProvider = Provider.of<HomeProvider>(context);
    await sourcesProvider.loadSources(homeProvider.selectedCategory!);
    if (sourcesProvider.sources.isNotEmpty) {
      articlesProvider.loadArticles(
        sourcesProvider.sources[sourcesProvider.selectedSource],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: articlesProvider),
        ChangeNotifierProvider.value(value: sourcesProvider),
      ],
      child: Column(
        children: [
          Visibility(
            visible: homeProvider.isSearch,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(right: 8,left: 8,top: 16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: homeProvider.cancelSearch,
                      icon:  Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          controller: homeProvider.searchController,
                          cursorColor: Theme.of(context).secondaryHeaderColor,
                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                          decoration: InputDecoration(
                            hintText: "Search..",
                            suffix: IconButton(
                              onPressed: homeProvider.onSearchClear,
                              icon: Icon(Icons.clear),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            articlesProvider.loadArticles(
                              sourcesProvider.sources[sourcesProvider.selectedSource],
                              value,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Consumer<SourcesProvider>(
            builder: (context, sourcesProvider, child) {
              if (sourcesProvider.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                );
              }
              if (sourcesProvider.errorMessage != null) {
                return Text(
                  sourcesProvider.errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                );
              }
              if (sourcesProvider.sources.isNotEmpty) {
                return DefaultTabController(
                  initialIndex: sourcesProvider.selectedSource,
                  length: sourcesProvider.sources.length,
                  child: TabBar(
                    onTap: (index) {
                      articlesProvider.loadArticles(
                        sourcesProvider.sources[index],
                      );
                      sourcesProvider.changeSource(index);
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    indicatorColor: Theme.of(context).secondaryHeaderColor,
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    unselectedLabelColor: Theme.of(
                      context,
                    ).secondaryHeaderColor,
                    labelStyle: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    unselectedLabelStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    tabs: sourcesProvider.sources
                        .map((e) => Tab(text: e.name))
                        .toList(),
                  ),
                );
              }
              return Container();
            },
          ),
          Consumer<ArticlesProvider>(
            builder: (context, articlesProvider, child) {
              if (articlesProvider.isLoading) {
                return CircularProgressIndicator(
                  color: Theme.of(context).secondaryHeaderColor,
                );
              }
              if (articlesProvider.errorMessage != null) {
                return Text(
                  articlesProvider.errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                );
              }

              List<Article> articles = articlesProvider.articles;
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articles[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
