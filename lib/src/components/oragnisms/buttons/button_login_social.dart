import 'package:flutter/material.dart';

class ButtonLoginSocial extends StatefulWidget {
  final String pathIcon;
  final String text;
  final Color textColor;
  final Function() funcClick;

  const ButtonLoginSocial(
      {required this.pathIcon,
      required this.text,
      required this.textColor,
      required this.funcClick,
      super.key});

  @override
  State<ButtonLoginSocial> createState() => _ButtonLoginSocialState();
}

class _ButtonLoginSocialState extends State<ButtonLoginSocial> {
  bool isActive = false;

  handleClick(e) {
    print("ee");
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
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTapDown: handleClick,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: const Color(0xfffff8f3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(!isActive ? 5 : 0, !isActive ? 6.5 : 0),
                color: const Color.fromRGBO(0, 0, 0, 0.1)),
          ],
        ),
        transform:
            Matrix4.translationValues(isActive ? 5 : 0, isActive ? 6.5 : 0, 0),
        padding: const EdgeInsets.all(9),
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.pathIcon,
                width: 36,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }
}
