import 'package:MochiChinese/src/constant/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CircleBackButton extends StatefulWidget {
  final String backPage;
  const CircleBackButton({required this.backPage, super.key});

  @override
  State<StatefulWidget> createState() => _CircleBackButton();
}

class _CircleBackButton extends State<CircleBackButton> {
  bool isActive = false;

  _handleClick(e) {
    setState(() {
      isActive = true;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => isActive = false);
      Future.delayed(const Duration(milliseconds: 200), () {
        context.go(widget.backPage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 45,
      height: 45,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45 / 2),
        boxShadow: [
          BoxShadow(
              offset: isActive ? Offset.zero : const Offset(0, 4.5),
              color: const Color.fromRGBO(0, 0, 0, 0.1)),
        ],
      ),
      transform: Matrix4.translationValues(0, isActive ? 3 : 0, 0),
      child: GestureDetector(
          onTapDown: _handleClick,
          child: SvgPicture.asset(AssetsManager.icons.icon_arrow_left_circle)),
    );
  }
}
