import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListLessonTopTitle extends StatelessWidget {
  final String title;
  final bool isShowIconDown;
  final Function? click;
  final int type;
  // type =1 , have data
  const ListLessonTopTitle(
      {this.title = "",
      this.click,
      required this.isShowIconDown,
      this.type = 1,
      super.key});

  _handleClick(e) {
    if (click != null && title != '') {
      click!();
    }
  }

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
          child: GestureDetector(
            onTapDown: _handleClick,
            child: Container(
              constraints: const BoxConstraints(minHeight: 56),
              decoration: BoxDecoration(
                  color: type == 1 ? const Color(0xfffb993b) : null,
                  gradient: type == 1
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xffe5e5e5), Color(0xffcbcbcb)]),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: type == 1
                            ? const Color.fromRGBO(255, 150, 0, 0.25)
                            : const Color.fromRGBO(0, 0, 0, 0.15),
                        offset: const Offset(4, 6),
                        blurRadius: 10)
                  ]),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
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
                  if (isShowIconDown)
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
              color:
                  type == 1 ? const Color(0xfffde3c5) : const Color(0xffcbcbcb),
              borderRadius: BorderRadius.only(
                  topLeft: leftRadisu,
                  bottomLeft: leftRadisu,
                  topRight: rightRadius,
                  bottomRight: rightRadius)),
        ));
  }
}
