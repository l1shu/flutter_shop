class HomePageContentModel {
  List<Swiper> swiperList;
  List<Navigator> navigatorList;
  List<Recommend> recommendList;
  List<Floor> floor1List;
  List<Floor> floor2List;
  List<Floor> floor3List;
  FloorPic floor1Pic;
  FloorPic floor2Pic;
  FloorPic floor3Pic;
  AdBanner adBanner;
  ShopInfo shopInfo;

  HomePageContentModel();

  factory HomePageContentModel.fromJson(Map<String, dynamic> json) {
    HomePageContentModel hcm = HomePageContentModel();

    AdBanner adBanner = AdBanner(
      json['advertesPicture']['PICTURE_ADDRESS']
    );
    ShopInfo shopInfo = ShopInfo(
      json['shopInfo']['leaderPhone'],
      json['shopInfo']['leaderImage'],
    );
    FloorPic floor1Pic = FloorPic(json['floor1Pic']['PICTURE_ADDRESS']);
    FloorPic floor2Pic = FloorPic(json['floor2Pic']['PICTURE_ADDRESS']);
    FloorPic floor3Pic = FloorPic(json['floor3Pic']['PICTURE_ADDRESS']);

    hcm.swiperList = (json['slides'] as List).map((item) => Swiper(item['image'], item['urlType'], item['goodsId'])).toList();
    hcm.navigatorList = (json['category'] as List).map((item) => Navigator(item['image'], item['mallCategoryName'])).toList();
    hcm.recommendList = (json['recommend'] as List).map((item) => Recommend(item['image'], item['price'], item['goodsName'])).toList();
    hcm.floor1List = (json['floor1'] as List).map((item) => Floor(item['image'], item['goodsId'])).toList();
    hcm.floor2List = (json['floor2'] as List).map((item) => Floor(item['image'], item['goodsId'])).toList();
    hcm.floor3List = (json['floor3'] as List).map((item) => Floor(item['image'], item['goodsId'])).toList();
    hcm.adBanner = adBanner;
    hcm.shopInfo = shopInfo;
    hcm.floor1Pic = floor1Pic;
    hcm.floor2Pic = floor2Pic;
    hcm.floor3Pic = floor3Pic;

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

class ShopInfo {
  final String phone;
  final String image;

  ShopInfo(this.phone, this.image);
}

class Recommend {
  final String image;
  final double price;
  final String name;

  Recommend(this.image, this.price, this.name);
}

class Floor {
  final String image;
  final String goodsId;

  Floor(this.image, this.goodsId);
}

class FloorPic {
  final String image;

  FloorPic(this.image);
}