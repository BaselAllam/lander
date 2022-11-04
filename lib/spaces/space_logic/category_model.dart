


class CategoryModel {

  final String id;
  final String categoryName;
  final String categoryImage;

  CategoryModel(this.id, this.categoryName, this.categoryImage);

  factory CategoryModel.fromJson(String id, Map<String, dynamic> data) {
    return CategoryModel(id, data['categoryName'], data['categoryImage']);
  } 
}