import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.photoPath,required this.onTap});
  final String photoPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: (){
          onTap();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            photoPath,
            fit: BoxFit.cover,
            ),
        ),
      ),
    );
  }
}
