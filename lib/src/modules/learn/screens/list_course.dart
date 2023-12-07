import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:MochiChinese/src/data/dtos/courses/course.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:MochiChinese/src/modules/learn/widgets/card_course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/molecules/bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/oragnisms/buttons/button.dart';
import '../../../components/oragnisms/wrap_popup_page.dart';

class ListCourse extends StatefulWidget {
  const ListCourse({super.key});

  @override
  State<StatefulWidget> createState() => _ListCourse();
}

class _ListCourse extends State<ListCourse> {
  bool isShow = false;
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              setState(() {
                isShow = true;
              })
            });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CourseDto> dataCourses =
        BlocProvider.of<CoursesCubit>(context).state.listCourse;
    final double screenWidth = MediaQuery.of(context).size.width;

    _handleClickCourse(CourseDto course) {
      if (course.isData) {
        context.go(ApplicationRouteName.learn);
      } else {
        ModalBottomSheet.showBottomSheet(
          context: context,
          imageTopPath: AssetsManager.mochi.mochi_ngai_ngung,
          widthImage: 180,
          positionbottomImage: 0,
          title: "Please inbox Mochi for assistance in changing your password",
          children: [
            Button(
              "BACK",
              height: 60,
              width: 200,
              funcClick: () {
                context.pop();
              },
            )
          ],
        );
      }
    }

    return WrapPopupPage(
      title: "COURSE",
      backPage: ApplicationRouteName.learn,
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.backgrounds.background_mobile),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: AnimatedContainer(
            transform:
                Matrix4.translationValues(isShow ? 0 : -screenWidth, 0, 0),
            duration: const Duration(milliseconds: 400),
            child: Column(
              children: [
                ...dataCourses.map((course) => CardCourse(
                    courseData: course,
                    funcClick: () => _handleClickCourse(course)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
