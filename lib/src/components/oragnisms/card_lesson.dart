import 'package:flutter/material.dart';

import '../../constant/assets_manager.dart';

class CardLesson extends StatefulWidget {
  final String title;
  final String description;
  Color borderColor = const Color.fromRGBO(189, 189, 189, 1);
  Color boxShadowColor = const Color.fromRGBO(189, 189, 189, 0.25);
  List<Color> lessonWrapTextColors = <Color>[
    const Color.fromRGBO(188, 188, 188, 1),
    const Color.fromRGBO(169, 169, 169, 1)
  ];
  Color descriptionColor = const Color.fromRGBO(197, 197, 197, 1);

  final Function() funcClick;
  String imageSrc = AssetsManager.images.cardLessonSilver;

  CardLesson({
    super.key,
    required this.title,
    required this.description,
    required this.funcClick,
  });
  @override
  State<StatefulWidget> createState() => _CardCourse();
}

class _CardCourse extends State<CardLesson> {
  bool isActive = false;

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
    // TODO: implement build

    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: Offset(isActive ? 0 : 5, isActive ? 0 : 6.5),
            color: widget.boxShadowColor,
          ),
        ],
      ),
      transform:
          Matrix4.translationValues(isActive ? 5 : 0, isActive ? 6.5 : 0, 0),
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTapDown: handleClick,
        child: Container(
            // margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.imageSrc)),
              border: Border.all(
                color: widget.borderColor,
                width: 2,
              ),
              color: Colors.green,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Stack(
              children: [
                _showLessonNumber(widget.title),
                Align(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: "RifficFree",
                        color: widget.descriptionColor),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _showLessonNumber(String title) {
    return Positioned(
        right: 10,
        top: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfff1f1f1), width: 1),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: widget.lessonWrapTextColors,
            ),
          ),
          child: Text(title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "RifficFree",
              )),
        ));
  }
}

class CardLockLesson extends CardLesson {
  CardLockLesson(
      {required super.title,
      required super.description,
      required super.funcClick}) {}
}

class CardUnLockLesson extends CardLesson {
  CardUnLockLesson(
      {required super.title,
      required super.description,
      required super.funcClick}) {
    super.borderColor = const Color.fromRGBO(255, 203, 8, 1);
    super.boxShadowColor = const Color.fromRGBO(251, 151, 59, 0.25);

    super.descriptionColor = const Color.fromRGBO(212, 108, 3, 1);
    super.lessonWrapTextColors = [
      const Color.fromRGBO(250, 142, 63, 1),
      const Color.fromRGBO(251, 150, 60, 1),
      const Color.fromRGBO(254, 182, 48, 1)
    ];
    super.imageSrc = AssetsManager.images.cardLessonOrange;
  }
}

class CardLearnedLesson extends CardLesson {
  CardLearnedLesson(
      {required super.title,
      required super.description,
      required super.funcClick}) {
    super.borderColor = const Color.fromRGBO(121, 203, 133, 1);
    super.boxShadowColor = const Color.fromRGBO(35, 172, 56, 0.25);

    super.descriptionColor = const Color.fromRGBO(4, 152, 27, 1);
    super.lessonWrapTextColors = [
      const Color.fromRGBO(96, 203, 115, 1.0),
      const Color.fromRGBO(50, 210, 74, 1.0),
      const Color.fromRGBO(69, 178, 84, 1.0)
    ];
    super.imageSrc = AssetsManager.images.cardLessonGreen;
  }
}
