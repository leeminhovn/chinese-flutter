import 'package:flutter/cupertino.dart';

import '../../../components/oragnisms/buttons/button.dart';
import '../../../constant/assets_manager.dart';

class ScreenNotHaveWordLearn extends StatelessWidget {
  const ScreenNotHaveWordLearn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        _bannerTop(screenWidth),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Image.asset(
            AssetsManager.mochi.mochi_hi,
            width: 200,
          ),
        ),
        _text01(),
        const SizedBox(
          height: 10,
        ),
        Button(
          "LEARN NEW WORDS",
          height: 65,
          funcClick: () {
            print('hahah');
          },
        )
      ],
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

  Widget _text01() => const Text.rich(
        TextSpan(
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(text: "To activate your"),
              TextSpan(
                  text: ' "Golden Time"',
                  style: TextStyle(color: Color(0xfffb993b))),
              TextSpan(text: ", learn a new lesson.")
            ]),
        textAlign: TextAlign.center,
      );
}
