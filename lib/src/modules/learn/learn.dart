import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/screens/list_lesson.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/molecules/bottom_sheet/modal_bottom_sheet.dart';
import '../../components/oragnisms/buttons/button.dart';
import '../../constant/assets_manager.dart';

class Learn extends StatefulWidget {
  final String infoPopupShow;
  const Learn({this.infoPopupShow = "", super.key});

  @override
  State<StatefulWidget> createState() => _Learn();
}

class _Learn extends State<Learn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    if (widget.infoPopupShow == "popupLearnALessonAfterLogin") {
      Future.delayed(
          const Duration(milliseconds: 300),
          () => {
                ModalBottomSheet.showBottomSheet(
                  context: AppConstants.rootKeyRoute.currentContext!,
                  imageTopPath: AssetsManager.mochi.success,
                  widthImage: 180,
                  positionbottomImage: -2,
                  title:
                      "You have successfully logged in. Let's start learning right away ^^",
                  children: [
                    Button(
                      "LEARN A LESSON",
                      height: 60,
                      width: 200,
                      funcClick: () {
                        context.pop();
                      },
                    )
                  ],
                )
              });
    }

    super.didUpdateWidget(oldWidget);
    // Mã này sẽ được thực hiện mỗi khi widget cha tái tạo widget con.
  }

  @override
  Widget build(BuildContext context) {
    return const ListLesson();
  }
}
