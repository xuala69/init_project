class CategoryModel {
  String id;
  String name;
  String description;
  String image;
  String parentId;

  CategoryModel(
      {this.id, this.name, this.description, this.image, this.parentId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    description = json['description'];
    image = json['image'];
    parentId = json['parent_id'].toString();
  }
}
