import '../resources/assets_manager.dart';

class CategoryModel{
  String name;
  String title;
  String lightPhoto;
  String darkPhoto;

  CategoryModel({
    required this.name,
    required this.lightPhoto,
    required this.darkPhoto,
   required this.title ,
});


  static List<CategoryModel> categories = [
      CategoryModel(

        name: "business",
        title: "Business",
        lightPhoto: AssetsManager.business,
        darkPhoto: AssetsManager.businessDark,
      ),
      CategoryModel(
        name: "entertainment",
        title: "Entertainment",
        lightPhoto: AssetsManager.entertainment,
        darkPhoto: AssetsManager.entertainmentDark,
      ),
      CategoryModel(
        name: "general",
        title: "General",
        lightPhoto: AssetsManager.general,
        darkPhoto: AssetsManager.generalDark,
      ),
      CategoryModel(
        name: "health",
        title: "Health",
        lightPhoto: AssetsManager.health,
        darkPhoto: AssetsManager.healthDark,
      ),
      CategoryModel(
        name: "science",
        title: "Science",
        lightPhoto: AssetsManager.science,
        darkPhoto: AssetsManager.scienceDark,
      ),
      CategoryModel(
        name: "sports",
        title: "Sports",
        lightPhoto: AssetsManager.sports,
        darkPhoto: AssetsManager.sportsDark,
      ),
      CategoryModel(
        name: "technology",
        title: "Technology",
        lightPhoto: AssetsManager.technology,
        darkPhoto: AssetsManager.technologyDark,
      ),
    ];

}