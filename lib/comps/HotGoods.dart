import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/homePageBelowModel.dart';

class HotGoods extends StatefulWidget {
  final List hotGoodsList;

  HotGoods({Key key, this.hotGoodsList}) : super(key: key); 

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {

  Widget _hotTitle = Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.bottomLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      border:Border(
        bottom: BorderSide(width:0.5 ,color:Colors.black12)
      )
    ),
    child: Text('火爆专区', style: TextStyle(color: Colors.pink),),
  );

  Widget _wrapList() {
    if (widget.hotGoodsList.length > 0) {
      List<Widget> list = widget.hotGoodsList.map((item) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color:Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(item.image, width: ScreenUtil().setWidth(375),),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${item.mallPrice}'),
                    Text(
                      '￥${item.price}',
                      style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: list,
      );
    } else {
      return Text(' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle,
          _wrapList()
        ],
      ),
    );
  }
}