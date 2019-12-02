import 'package:flutter/material.dart';
import 'package:flutter_shop/comps/AdBanner.dart';
import 'package:flutter_shop/comps/swiperWidget.dart';
import 'package:flutter_shop/comps/topNavigator.dart';
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;
import 'package:flutter_shop/service/service_methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHomePageContent(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          hpcm.HomePageContentModel homePageContent = hpcm.HomePageContentModel.fromJson(snapshot.data['data']);

          return Column(
            children: <Widget>[
              SwiperWidget(swiperList: homePageContent.swiperList,),
              TopNavigator(homePageContent.navigatorList),
              AdBanner(banner: homePageContent.adBanner,)
            ],
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