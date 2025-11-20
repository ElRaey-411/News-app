import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/article_item.dart';

class SourcesTab extends StatelessWidget {
  const SourcesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
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
            tabs: [
              Tab(text: "Business"),
              Tab(text: "Entertainment"),
              Tab(text: "General"),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ArticleItem();
            },
          ),
        ),
      ],
    );
  }
}
