import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/assets_manager.dart';

class ListLessonTopTitle extends StatelessWidget {
  const ListLessonTopTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        _bothContai("left"),
        _bothContai("right"),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
            constraints: const BoxConstraints(minHeight: 56),
            decoration: BoxDecoration(
                color: const Color(0xfffb993b),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(255, 150, 0, 0.25),
                      offset: Offset(4, 6),
                      blurRadius: 10)
                ]),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  "100 basic Chinese vocabulary",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1,
                    letterSpacing: 1,
                    fontFamily: "RifficFree",
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                Positioned(
                  right: 5,
                  child: SvgPicture.asset(
                    AssetsManager.icons.ic_white_arrow_down,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bothContai(String direction) {
    Radius rightRadius =
        direction == "right" ? const Radius.circular(15) : Radius.zero;
    Radius leftRadisu =
        direction == "left" ? const Radius.circular(15) : Radius.zero;

    return Positioned(
        bottom: -14,
        height: 54,
        right: direction == "right" ? -25 : null,
        left: direction == "left" ? -25 : null,
        width: 50,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xfffde3c5),
              borderRadius: BorderRadius.only(
                  topLeft: leftRadisu,
                  bottomLeft: leftRadisu,
                  topRight: rightRadius,
                  bottomRight: rightRadius)),
        ));
  }
}
