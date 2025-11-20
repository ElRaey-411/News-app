import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.article.title,
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
                provider.article.author,
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
            "${provider.article.date}, ${provider.article.time}",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorsManager.grey,
            ),
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(provider.article.imageUrl, fit: BoxFit.cover),
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
            provider.article.description,
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
