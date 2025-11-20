import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/home_screen/provider/home_provider.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: (){
        provider.showModalSheet(context);
      },
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Container(
          height: 322.h,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    provider.article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h,),
                Expanded(
                  child: Text(
                    provider.article.title,style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.article.author,style: Theme.of(context).textTheme.headlineSmall),
                    Text(provider.article.time,style: Theme.of(context).textTheme.headlineSmall),
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
