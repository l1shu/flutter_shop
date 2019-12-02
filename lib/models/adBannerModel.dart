class AdBannerModel {
  final String image;

  AdBannerModel(this.image);

  AdBannerModel.fromJson(Map<String, dynamic> json) 
    : image = json['PICTURE_ADDRESS'];
}