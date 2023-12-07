import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:MochiChinese/src/data/dtos/courses/course.dart';
import 'package:MochiChinese/src/modules/learn/widgets/list_lesson_top_title.dart';
import 'package:flutter/material.dart';

class CardCourse extends StatefulWidget {
  final CourseDto courseData;
  final Function funcClick;
  const CardCourse(
      {required this.courseData, required this.funcClick, super.key});

  @override
  State<StatefulWidget> createState() => _CardCourse();
}

class _CardCourse extends State<CardCourse> {
  bool isActive = false;

  _handleClick(e) {
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

  Widget _rowInfo(String assetsPath, String text, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          assetsPath,
          width: width,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromRGBO(99, 94, 95, 0.8),
                fontSize: 19,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contrains) {
      return GestureDetector(
        onTapDown: _handleClick,
        child: AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: (190 / 390) * contrains.maxWidth,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            border: Border.all(color: const Color(0xffffcb08), width: 2),
            boxShadow: [
              BoxShadow(
                offset: Offset(isActive ? 0 : 5, isActive ? 0 : 6.5),
                color: const Color.fromRGBO(251, 151, 59, .2),
              ),
            ],
          ),
          transform: Matrix4.translationValues(
              isActive ? 5 : 0, isActive ? 6.5 : 0, 0),
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ListLessonTopTitle(
                  title: widget.courseData.title,
                  isShowIconDown: false,
                  type: widget.courseData.isData ? 1 : 0,
                ),
                const SizedBox(
                  height: 30,
                ),
                _rowInfo(AssetsManager.icons.icon_target,
                    widget.courseData.outcome, 40),
                const SizedBox(
                  height: 10,
                ),
                _rowInfo(AssetsManager.icons.icon_vocab_tab,
                    widget.courseData.description, 40)
              ],
            ),
          ),
        ),
      );
    });
  }
}
