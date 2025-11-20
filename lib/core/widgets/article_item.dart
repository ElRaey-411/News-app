import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/light_pics/business.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h,),
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, seddawda wdawdaw dawdawda wdawdawdfafada dawdawdawdawd",style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("dawdawdawd",style: Theme.of(context).textTheme.headlineSmall),
                  Text("dawdawdawd",style: Theme.of(context).textTheme.headlineSmall),
                ]
              ),
            ]
          ),
        ),
      ),
    );
  }
}
