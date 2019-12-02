import 'package:flutter/material.dart';
import 'package:flutter_shop/models/homePageContentModel.dart' as hpcm;

class AdBanner extends StatelessWidget {
  final hpcm.AdBanner banner;

  AdBanner({Key key, this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(banner.image),
    );
  }
}