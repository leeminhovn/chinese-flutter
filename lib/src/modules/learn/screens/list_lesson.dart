import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/src/components/molecules/bottom_sheet/modal_bottom_sheet.dart';
import 'package:MochiChinese/src/components/oragnisms/card_lesson.dart';
import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:MochiChinese/src/modules/learn/widgets/list_lesson_top_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/oragnisms/buttons/button.dart';
import '../../../constant/assets_manager.dart';
import '../../../data/dtos/courses/info_lesson_course.dart';

class ListLesson extends StatefulWidget {
  const ListLesson({super.key});

  @override
  State<StatefulWidget> createState() => _ListLesson();
}

class _ListLesson extends State<ListLesson> {
  _handleClickTitleCourse() {
    context.go((ApplicationRouteName.list_course));
  }

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
    handleClickLockLesson() {
      ModalBottomSheet.showBottomSheet(
        context: AppConstants.rootKeyRoute.currentContext!,
        imageTopPath: AssetsManager.mochi.mochi_notice,
        positionbottomImage: 29.5,
        widthImage: 250,
        title:
            'Create an account to unlock lessons \n and activate the "Golden Time"',
        children: [
          Button(
            "CREATE AN ACCOUNT",
            height: 60,
            width: 250,
            funcClick: () {
              context.pop();
              context.push(ApplicationRouteName.signup);
            },
          ),
          Button(
            "LOG IN",
            height: 60,
            color: "green",
            width: 250,
            funcClick: () {
              context.pop();
              context.push(ApplicationRouteName.login);
            },
          )
        ],
      );
    }

    handleCLickLearnedLesson() {}

    return BlocBuilder<CoursesCubit, CoursesState>(builder: (context, state) {
      final String titleCourse =
          state is LessonsLoading ? "" : state.currentCourse!.title;
      return Column(
        children: [
          ListLessonTopTitle(
            title: titleCourse,
            isShowIconDown: true,
            click: _handleClickTitleCourse,
          ),
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
                      return CardUnLockLesson(
                          title: data.title,
                          funcClick: handleClickOpenLesson,
                          description: data.description);
                    case 2:
                      return CardLearnedLesson(
                        title: data.title,
                        funcClick: handleCLickLearnedLesson,
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
