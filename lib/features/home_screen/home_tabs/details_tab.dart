import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/models/articles_response/Article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class DetailsTab extends StatelessWidget {
  DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.selectedArticle!.title??"",
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                "by ",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.grey,
                ),
              ),
              Text(
                provider.selectedArticle!.author??"",
                style: GoogleFonts.inter(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Text(
            provider.dateTimeShape(provider.selectedArticle!.publishedAt??""),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorsManager.grey,
            ),
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
              child: Image.network(
                provider.selectedArticle!.urlToImage??"",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Icon(Icons.broken_image),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor,));
                },
              )
          ),
          SizedBox(height: 16.h),
          Divider(
            color: ColorsManager.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(height: 16.h),
          Text(
            provider.selectedArticle!.description??"",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ],
      ),
    );
  }
}
