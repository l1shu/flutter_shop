class SwiperModel {
  final String image;
  final int urlType;
  final String goodsId;

  SwiperModel(this.image, this.urlType, this.goodsId);

  SwiperModel.fromJson(Map<String, dynamic> json) 
    : image = json['image'],
      urlType = json['urlType'],
      goodsId = json['goodsId'];
}