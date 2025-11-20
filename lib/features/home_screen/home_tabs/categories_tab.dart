import 'package:flutter/material.dart';

import '../../../core/models/category_model.dart';
import '../../../core/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Good Morning\nHere is Some News For You",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: ListView.builder(
            itemCount:  CategoryModel.categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                photoPath: CategoryModel.categories[index].darkPhoto,);
            }
          ),
        ),
      ],
    );
  }
}
