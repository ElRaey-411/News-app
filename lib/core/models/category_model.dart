import '../resources/assets_manager.dart';

class CategoryModel{
  String id;
  String name;
  String lightPhoto;
  String darkPhoto;

  CategoryModel({
    required this.id,
    required this.name,
    required this.lightPhoto,
    required this.darkPhoto,
});


  static List<CategoryModel> categories = [
      CategoryModel(
        id: "1",
        name: "Business",
        lightPhoto: AssetsManager.business,
        darkPhoto: AssetsManager.businessDark,
      ),
      CategoryModel(
        id: "2",
        name: "Entertainment",
        lightPhoto: AssetsManager.entertainment,
        darkPhoto: AssetsManager.entertainmentDark,
      ),
      CategoryModel(
        id: "3",
        name: "General",
        lightPhoto: AssetsManager.general,
        darkPhoto: AssetsManager.generalDark,
      ),
      CategoryModel(
        id: "4",
        name: "Health",
        lightPhoto: AssetsManager.health,
        darkPhoto: AssetsManager.healthDark,
      ),
      CategoryModel(
        id: "5",
        name: "Science",
        lightPhoto: AssetsManager.science,
        darkPhoto: AssetsManager.scienceDark,
      ),
      CategoryModel(
        id: "6",
        name: "Sports",
        lightPhoto: AssetsManager.sports,
        darkPhoto: AssetsManager.sportsDark,
      ),
      CategoryModel(
        id: "7",
        name: "Technology",
        lightPhoto: AssetsManager.technology,
        darkPhoto: AssetsManager.technologyDark,
      ),
    ];

}