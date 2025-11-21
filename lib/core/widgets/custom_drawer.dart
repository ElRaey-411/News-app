import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../config/providers/ConfigProvider.dart';
import 'custom_drop_down_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var configProvider = Provider.of<ConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 65),
          color: Theme.of(context).secondaryHeaderColor,
          height: 166.h,
          child: Text(
            "News App",
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Visibility(
            visible: !provider.isHome,
            child: InkWell(
              onTap: () {
                provider.navigateToHome();
                provider.isSearch = false;
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Go To Home",
                    style: GoogleFonts.inter(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Visibility(
          visible: !provider.isHome,
          child: Divider(
            color: Theme.of(context).secondaryHeaderColor,
            thickness: 2.h,
            indent: 16.w,
            endIndent: 16.w,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [Icon(Icons.format_paint_rounded),
            SizedBox(width: 8.w),
            Text(
              "Theme",
              style: GoogleFonts.inter(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),]),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: CustomDropDownButton(
            itemsList: ["light", "dark"],
            selecetedItem: configProvider.isDark ? "dark" : "light",
            onChanged: (newTheme) {
              configProvider.changeTheme(
                newTheme == "light" ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          color: Theme.of(context).secondaryHeaderColor,
          thickness: 2.h,
          indent: 16.w,
          endIndent: 16.w,
        ),
      ],
    );
  }
}
