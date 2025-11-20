import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/home_screen/provider/home_provider.dart';
import '../models/articles_response/Article.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  Article article;


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: (){
        provider.showModalSheet(context, article);
      },
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Container(
          height: 361.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
                color: Theme.of(context).secondaryHeaderColor,
                width: 1.w,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: article.urlToImage??"",
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor,value: downloadProgress.downloaded.toDouble(),),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),

                  ),
                ),
                SizedBox(height: 16.h,),
                Text(
                  article.title??"",style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 3,
                ),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(article.author??"",style: Theme.of(context).textTheme.headlineSmall),
                    Text(provider.dateTimeShape(article.publishedAt??""),style: Theme.of(context).textTheme.headlineSmall),
                  ]
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
