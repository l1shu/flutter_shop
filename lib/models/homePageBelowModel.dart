class HomePageBelowModel {
  List<BelowItem> belowList;

  HomePageBelowModel();

  factory HomePageBelowModel.fromJson(List json) {
    HomePageBelowModel hpbm = HomePageBelowModel();

    hpbm.belowList = (json as List).map((item) => BelowItem(item['name'], item['image'], item['price'], item['mallPrice'])).toList();

    return hpbm;
  }
}

class BelowItem {
  final String name;
  final String image;
  final double price;
  final double mallPrice;
  
  BelowItem(this.name, this.image, this.price, this.mallPrice);
}