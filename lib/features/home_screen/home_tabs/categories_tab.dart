import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/category_model.dart';
import '../../../core/widgets/category_item.dart';
import '../provider/home_provider.dart';

class CategoriesTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<HomeProvider>(context);
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
                onTap: (){
                  provider.navigateToSources(index);
                },
                photoPath: CategoryModel.categories[index].darkPhoto,);
            }
          ),
        ),
      ],
    );
  }
}
