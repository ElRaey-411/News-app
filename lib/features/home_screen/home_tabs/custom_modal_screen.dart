import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import '../provider/home_provider.dart';

class CustomModalScreen extends StatelessWidget {

   CustomModalScreen({super.key, required this.provider});
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      height: 361.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
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
          SizedBox(height: 8.h,),
          Expanded(
            child: Text(
              provider.article.description
                  ,maxLines: 5,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 8.h,),
          ElevatedButton(onPressed: (){provider.navigateToDetails();
            Navigator.pop(context);
          }, child: Text("View Full Article"))
        ],
      )

    );
  }
}
