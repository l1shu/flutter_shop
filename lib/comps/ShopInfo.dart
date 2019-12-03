import 'package:flutter/material.dart';
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;
import 'package:url_launcher/url_launcher.dart';

class ShopInfo extends StatelessWidget {
  final hpcm.ShopInfo shopInfo;

  ShopInfo(this.shopInfo);

  void _launch() async {
    String url = 'tel:${shopInfo.phone}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> _showAlert(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('确认框'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('确认拨打电话吗')
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text("拨打"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await _showAlert(context)) {
          _launch();
        }
      },
      child: Image.network(shopInfo.image),
    );
  }
}