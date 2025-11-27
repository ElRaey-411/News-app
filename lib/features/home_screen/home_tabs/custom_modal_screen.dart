import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/articles_response/Article.dart';
import '../provider/home_provider.dart';

class CustomModalScreen extends StatelessWidget {
  const CustomModalScreen({super.key, required this.provider, required this.article});

  final HomeProvider provider;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      height: 380.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 220.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                article.urlToImage ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Icon(Icons.broken_image),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
                },
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            child: Text(
              article.title ?? "",
              maxLines: 3,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 8.h),
          ElevatedButton(
            onPressed: () {
              provider.navigateToDetails();
              provider.cancelSearch();
              Navigator.pop(context);
            },
            child: Text("View Full Article"),
          ),
        ],
      ),
    );
  }
}
