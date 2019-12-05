import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;

class TopNavigator extends StatelessWidget {
  List<hpcm.Navigator> navigatorList;

  TopNavigator(List<hpcm.Navigator> navigatorList) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    this.navigatorList = navigatorList;
  }

  Widget _getGridViewItem(hpcm.Navigator item) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        children: <Widget>[
          Image.network(item.image, width: ScreenUtil().setWidth(95),),
          Text(item.name)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),
        children: navigatorList.map((item) => _getGridViewItem(item)).toList(),
      ),
    );
  }
}