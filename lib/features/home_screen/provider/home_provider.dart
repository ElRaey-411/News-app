import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import '../../../core/models/articles_response/Article.dart';
import '../../../core/models/category_model.dart';
import '../home_tabs/categories_tab.dart';
import '../home_tabs/custom_modal_screen.dart';
import '../home_tabs/details_tab.dart';
import '../home_tabs/view_tab.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  String title = "Home";
  int selectedTab = 0;
  int? selectedCategory;
  bool isHome = true;
  bool isSearch = false;
  Article? selectedArticle;

 void onSearchClear(){
   searchController.clear();
   notifyListeners();
 }

  void cancelSearch(){
    isSearch = false;
    searchController.clear();
    notifyListeners();
  }

  void onSearch(){
    isSearch = true;
    notifyListeners();
  }


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

  void showModalSheet(BuildContext context, Article article) {
    selectedArticle = article;
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (_) => CustomModalScreen(provider: this,article: article,),
    );
  }

  void navigateToHome() {
    title = "Home";
    selectedCategory = null;
    selectedTab = 0;
    isHome = true;
    notifyListeners();
  }

  String dateTimeShape(String text){
    if (text.length > 3) {
      String newText = text.substring(0, text.length - 4);
      newText = newText.replaceAll("T", " ").replaceAll("Z", "").replaceAll("-", "/");
      return newText;
    } else {
      return text;
    }
  }

  List<Widget> tabs = [CategoriesTab(), ViewTab(),
    DetailsTab()
  ];

}