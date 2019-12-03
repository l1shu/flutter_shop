import 'package:flutter/material.dart';
import 'package:flutter_shop/models/homePageContentModel.dart';

class FloorTitle extends StatelessWidget {
  final FloorPic floorPic; // 图片地址
  FloorTitle({Key key, this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(floorPic.image),
    );
  }
}