import 'package:MochiChinese/src/components/oragnisms/card_lesson.dart';
import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:MochiChinese/src/modules/learn/widgets/list_lesson_top_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dtos/courses/info_lesson_course.dart';

class ListLesson extends StatefulWidget {
  const ListLesson({super.key});

  @override
  State<StatefulWidget> createState() => _ListLesson();
}

class _ListLesson extends State<ListLesson> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    late int countItemRow = 1;

    if (screenWidth > AppConstants.minDesktopWidth) {
      countItemRow = 3;
    } else if (screenWidth > AppConstants.minTableWidth) {
      countItemRow = 2;
    }
    handleClickOpenLesson() {}
    handleClickLockLesson() {}
    handleCLickLearnedLesson() {}

    return BlocBuilder<CoursesCubit, CoursesState>(builder: (context, state) {
      final String titleCourse =
          state is LessonsLoading ? "" : state.currentCourse!.title;
      return Column(
        children: [
          ListLessonTopTitle(title: titleCourse),
          const SizedBox(
            height: 10,
          ),
          if (state is! LessonsLoading)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 50, bottom: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: countItemRow,
                    childAspectRatio: 331 / 137,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 15),
                itemCount: state.currentLessons.length,
                itemBuilder: (BuildContext context, int index) {
                  final LessonDto data = state.currentLessons[index];

                  int type = data.isOpen == true
                      ? data.isLearned == true
                          ? 2
                          : 1
                      : 0;

                  //notOpen
                  switch (type) {
                    case 0:
                      return CardLockLesson(
                        title: data.title,
                        funcClick: handleClickLockLesson,
                        description: data.description,
                      );
                    case 1:
                      return CardLockLesson(
                          title: data.title,
                          funcClick: handleClickLockLesson,
                          description: data.description);
                    case 2:
                      return CardLearnedLesson(
                        title: data.title,
                        funcClick: handleClickLockLesson,
                        description: data.description,
                      );
                  }
                },
              ),
            ),
        ],
      );
    });
  }
}
