import 'package:MochiChinese/src/modules/learn/widgets/list_lesson_top_title.dart';
import 'package:flutter/cupertino.dart';

class ListLesson extends StatefulWidget {
  const ListLesson({super.key});

  @override
  State<StatefulWidget> createState() => _ListLesson();
}

class _ListLesson extends State<ListLesson> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ListLessonTopTitle()],
    );
  }
}
