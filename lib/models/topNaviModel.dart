class TopNaviModel {
  final String image;
  final String name;

  TopNaviModel(this.image, this.name);

  TopNaviModel.fromJson(Map<String, dynamic> json)
    : image = json['image'],
      name = json['mallCategoryName'];
}