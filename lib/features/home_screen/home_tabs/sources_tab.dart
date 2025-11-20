import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/models/sources_response/Sources.dart';
import 'package:news_app/features/home_screen/provider/articles_provider.dart';
import 'package:provider/provider.dart';
import '../../../config/api/api_service.dart';
import '../../../core/models/articles_response/Article.dart';
import '../../../core/models/category_model.dart';
import '../../../core/widgets/article_item.dart';
import '../provider/home_provider.dart';
import '../provider/sources_provider.dart';

class SourcesTab extends StatefulWidget {
  const SourcesTab({super.key});

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  late SourcesProvider sourcesProvider;
  late HomeProvider homeProvider;
  late ArticlesProvider articlesProvider;
  @override
  void initState() {
    super.initState();
    sourcesProvider=SourcesProvider();
    articlesProvider=ArticlesProvider();

  }

  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    homeProvider = Provider.of<HomeProvider>(context);
  await  sourcesProvider.loadSources(homeProvider.selectedCategory!);
  if(sourcesProvider.sources.isNotEmpty){
    articlesProvider.loadArticles(sourcesProvider.sources[0]);
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
           Consumer<SourcesProvider>(
             builder: (context, sourcesProvider, child) {
               if(sourcesProvider.isLoading){
                 return Center(child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor,));
               }
               if(sourcesProvider.errorMessage!=null){
                 return Text(sourcesProvider.errorMessage!,style: TextStyle(color: Colors.red,fontSize: 20.sp),);
               }
               if(sourcesProvider.sources.isNotEmpty){
                 return DefaultTabController(
                   length: sourcesProvider.sources.length,
                   child: TabBar(
                     onTap: (index){
                       articlesProvider.loadArticles(sourcesProvider.sources[index]);
                     },
                     isScrollable: true,
                     tabAlignment: TabAlignment.start,
                     dividerColor: Colors.transparent,
                     indicatorColor: Theme.of(context).secondaryHeaderColor,
                     labelColor: Theme.of(context).secondaryHeaderColor,
                     unselectedLabelColor: Theme.of(context).secondaryHeaderColor,
                     labelStyle: GoogleFonts.inter(
                         fontSize: 16.sp,
                         fontWeight: FontWeight.bold,
                         color: Theme.of(context).secondaryHeaderColor
                     ),
                     unselectedLabelStyle: GoogleFonts.inter(
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w500,
                         color: Theme.of(context).secondaryHeaderColor
                     ),
                     tabs: sourcesProvider.sources.map((e) => Tab(
                       text: e.name,
                     )).toList(),
      
                   ),
                 );
               }
               return Container();
             }
      
           ),
            Consumer<ArticlesProvider>(
              builder:(context,articlesProvider,child){
                if(articlesProvider.isLoading){
                  return CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor,);}
                if(articlesProvider.errorMessage!=null){
                  return Text(articlesProvider.errorMessage!,style: TextStyle(color: Colors.red,fontSize: 20.sp),);
                }
      
                  List<Article> articles = articlesProvider.articles;
                return Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ArticleItem(
                      article: articles[index],
                  )
                ),
                );
      
      })
          ],
        ),

    );
  }
}
