import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/comps/AdBanner.dart';
import 'package:flutter_shop/comps/FloorContent.dart';
import 'package:flutter_shop/comps/FloorTitle.dart';
import 'package:flutter_shop/comps/HotGoods.dart';
import 'package:flutter_shop/comps/Recommend.dart';
import 'package:flutter_shop/comps/ShopInfo.dart';
import 'package:flutter_shop/comps/swiperWidget.dart';
import 'package:flutter_shop/comps/topNavigator.dart';
import 'package:flutter_shop/models/homePageBelowModel.dart' as hpbm;
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;
import 'package:flutter_shop/service/service_methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  hpcm.HomePageContentModel homePageContent; // 主页数据
  List _hotGoodsList = List(); // 火爆商品列表
  int page = 1; // 火爆商品页数

  Future _getHomePageContent() async {
    dynamic data = await getDataFromApi('homePageContext', data: {'lon':'115.02932','lat':'35.76189'});
    hpcm.HomePageContentModel homePageContent = hpcm.HomePageContentModel.fromJson(data['data']);
    setState(() {
      this.homePageContent = homePageContent;
    });
  }

  Future _getHotGoods() async {
    dynamic data = await getDataFromApi('homePageBelowConten', data: {'page': page});
    hpbm.HomePageBelowModel homePageBelowContent = hpbm.HomePageBelowModel.fromJson(data['data']);
    setState(() {
      _hotGoodsList.addAll(homePageBelowContent.belowList);
      page++;
    });
  }

  @override
  void initState() {
    super.initState();
    _getHomePageContent();
    _getHotGoods();
  }

  @override
  Widget build(BuildContext context) {
    print('home page build');
    super.build(context);
    if (homePageContent != null && _hotGoodsList.length > 0) {
      return EasyRefresh(
        child: ListView(
          children: <Widget>[
            SwiperWidget(swiperList: homePageContent.swiperList,),
            TopNavigator(homePageContent.navigatorList),
            AdBanner(banner: homePageContent.adBanner,),
            ShopInfo(homePageContent.shopInfo),
            Recommend(recommendList: homePageContent.recommendList),
            FloorTitle(floorPic: homePageContent.floor1Pic,),
            FloorContent(floorGoodsList: homePageContent.floor1List,),
            FloorTitle(floorPic: homePageContent.floor2Pic,),
            FloorContent(floorGoodsList: homePageContent.floor2List,),
            FloorTitle(floorPic: homePageContent.floor3Pic,),
            FloorContent(floorGoodsList: homePageContent.floor3List,),
            HotGoods(hotGoodsList: _hotGoodsList,),
          ],
        ),
        onLoad: () async {
          _getHotGoods();
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}