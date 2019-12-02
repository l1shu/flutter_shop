class HomePageContentModel {
  List<Swiper> swiperList;
  List<Navigator> navigatorList;
  AdBanner adBanner;

  HomePageContentModel();

  factory HomePageContentModel.fromJson(Map<String, dynamic> json) {
    HomePageContentModel hcm = HomePageContentModel();

    AdBanner adBanner = AdBanner(
      json['advertesPicture']['PICTURE_ADDRESS']
    );

    hcm.swiperList = (json['slides'] as List).map((item) => Swiper(item['image'], item['urlType'], item['goodsId'])).toList();
    hcm.navigatorList = (json['category'] as List).map((item) => Navigator(item['image'], item['mallCategoryName'])).toList();
    hcm.adBanner = adBanner;

    return hcm;
  }
}

class Swiper {
  final String image;
  final int urlType;
  final String goodsId;

  Swiper(this.image, this.urlType, this.goodsId);
}

class AdBanner {
  final String image;

  AdBanner(this.image);
}

class Navigator {
  final String image;
  final String name;

  Navigator(this.image, this.name);
}