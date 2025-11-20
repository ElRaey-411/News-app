import 'package:flutter/cupertino.dart';
import '../../../core/models/category_model.dart';
import '../home_tabs/categories_tab.dart';
import '../home_tabs/sources_tab.dart';

class HomeProvider extends ChangeNotifier{

  String title="Home";
  int selectedTab = 0;
  int? selectedCategory;
  bool isHome=true;

  void navigateToSources(int index){
    title=CategoryModel.categories[index].name;
    selectedCategory = index;
    selectedTab=1;
    isHome=false;
    notifyListeners();
  }

  void navigateToHome(){
    title="Home";
    selectedCategory = null;
    selectedTab=0;
    isHome=true;
    notifyListeners();
  }



  List<Widget> tabs =[
  CategoriesTab(),
  SourcesTab(),
];
}