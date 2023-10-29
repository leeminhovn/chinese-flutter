import 'package:MochiChinese/config/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../components/oragnisms/mochi_version.dart';
import '../../constant/assets_manager.dart';

class Splase extends StatefulWidget {
  const Splase({super.key});

  @override
  State<StatefulWidget> createState() => _Splase();
}

class _Splase extends State<Splase> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),
        () => GoRouter.of(context).go(ApplicationRouteName.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xfffff3e4),
      child: SafeArea(
        child: Scaffold(
            body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.backgrounds.background),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft)),
          child: Column(
            children: [
              _logoMochi(),
              const SizedBox(
                height: 20,
              ),
              _mochiHello(),
              _textContent(),
              const Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.bottomLeft, child: MochiVersion()),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _logoMochi() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        AssetsManager.images.logo_mochi_chinese,
        alignment: Alignment.centerLeft,
        height: 30,
      ),
    );
  }

  Widget _mochiHello() {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Lottie.asset(AssetsManager.animations.mochi_chaomung,
            width: double.infinity));
  }

  Widget _textContent() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Mochi Chinese - ",
            style: TextStyle(color: Color(0XFFffa500)),
          ),
          TextSpan(
              text: "Learn Chinese Online For Beginners",
              style: TextStyle(color: Color(0xff5b2d11))),
        ],
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "Quicksand"),
      ),
    );
  }
}
