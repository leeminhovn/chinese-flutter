import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final String color;
  final Function() funcClick;
  final double width;
  final double height;

  const Button(this.text,
      {this.color = "orange",
      this.width = 270,
      this.height = 57,
      required this.funcClick,
      super.key});
  @override
  State<StatefulWidget> createState() => _Button();
}

class _Button extends State<Button> {
  bool isActive = false;
  late StyleButton buttonStyle;

  @override
  void initState() {
    setState(() {
      if (widget.color == "orange") {
        buttonStyle = StyleButton(
            topColor: const Color(0xfffdd868),
            middleColor: const [
              Color(0xffffc153),
              Color(0xfffa8c3f),
            ],
            footerColor: const Color(0xfff95c08));
      } else if (widget.color == "green") {
        buttonStyle = StyleButton(
            topColor: const Color(0xff25a930),
            middleColor: const [
              Color(0xff59f672),
              Color(0xff4dd563),
            ],
            footerColor: const Color(0xff25a930));
      }
    });
    super.initState();
  }

  handleClick(e) {
    setState(() {
      isActive = true;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => isActive = false);
      Future.delayed(const Duration(milliseconds: 200), () {
        widget.funcClick();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 3),
                color: Color.fromRGBO(0, 0, 0, isActive ? 0 : 0.1)),
          ],
        ),
        transform:
            Matrix4.translationValues(isActive ? 2 : 0, isActive ? 3 : 0, 0),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.only(bottom: 5.6, right: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: buttonStyle.footerColor,
            border: Border.all(width: 5, color: const Color(0xfffff8f3)),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: buttonStyle.middleColor,
              ),
              borderRadius: BorderRadius.circular(15),
              color: buttonStyle.topColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: "RifficFree",
                    fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StyleButton {
  final Color topColor;
  final List<Color> middleColor;
  final Color footerColor;
  StyleButton(
      {this.topColor = Colors.transparent,
      this.middleColor = const [Colors.transparent, Colors.transparent],
      this.footerColor = Colors.transparent});
}
