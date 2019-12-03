import 'package:flutter/material.dart';
import 'package:flutter_shop/comps/AdBanner.dart';
import 'package:flutter_shop/comps/FloorContent.dart';
import 'package:flutter_shop/comps/FloorTitle.dart';
import 'package:flutter_shop/comps/Recommend.dart';
import 'package:flutter_shop/comps/ShopInfo.dart';
import 'package:flutter_shop/comps/swiperWidget.dart';
import 'package:flutter_shop/comps/topNavigator.dart';
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;
import 'package:flutter_shop/service/service_methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: getHomePageContent(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          hpcm.HomePageContentModel homePageContent = hpcm.HomePageContentModel.fromJson(snapshot.data['data']);

          return SingleChildScrollView(
            child: Column(
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
                FloorContent(floorGoodsList: homePageContent.floor3List,)
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}