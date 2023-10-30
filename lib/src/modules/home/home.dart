import 'package:MochiChinese/src/constant/assets_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[_bannerTop(screenWidth)],
      ),
    );
  }

  Widget _bannerTop(double screenWidth) {
    final String urlImage = screenWidth <= 1024
        ? AssetsManager.banners.banner_mobile
        : AssetsManager.banners.banner;
    return Image.asset(
      urlImage,
      width: double.infinity,
    );
  }
}
