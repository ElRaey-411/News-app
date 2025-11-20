import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/widgets/article_item.dart';
import '../../../core/models/category_model.dart';
import '../home_tabs/categories_tab.dart';
import '../home_tabs/custom_modal_screen.dart';
import '../home_tabs/details_tab.dart';
import '../home_tabs/sources_tab.dart';

class HomeProvider extends ChangeNotifier {
  String title = "Home";
  int selectedTab = 0;
  int? selectedCategory;
  bool isHome = true;

  void navigateToSources(int index) {
    title = CategoryModel.categories[index].name;
    selectedCategory = index;
    selectedTab = 1;
    isHome = false;
    notifyListeners();
  }

  void navigateToDetails() {
    title = "";
    selectedTab = 2;
    isHome = false;
    notifyListeners();
  }

  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (_) => CustomModalScreen(provider: this,),
    );
  }

  void navigateToHome() {
    title = "Home";
    selectedCategory = null;
    selectedTab = 0;
    isHome = true;
    notifyListeners();
  }

  List<Widget> tabs = [CategoriesTab(), SourcesTab(),
    DetailsTab()
  ];

  ArticleModel article = ArticleModel(
    category: CategoryModel.categories[0],
    title: "Lorem ipsum ",
    description:
        "dawda d awd awd awd aikhr;o 8ihsljk n 8yhdw ianwdo8uhawduja nwdp0awd",
    author: "dddddd",
    date: "10/11/2020",
    time: "12:22",
    imageUrl: CategoryModel.categories[0].darkPhoto
  );
}
