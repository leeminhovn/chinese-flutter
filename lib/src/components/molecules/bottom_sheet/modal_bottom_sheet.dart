import 'package:MochiChinese/src/components/oragnisms/buttons/close_orange_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ModalBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final bool isShowCloseButton;
  final String title;
  final String? imageTopPath;
  final double widthImage;
  final double positionbottomImage;
  const ModalBottomSheet(
      {required this.children,
      required this.title,
      this.imageTopPath,
      required this.widthImage,
      required this.positionbottomImage,
      this.isShowCloseButton = true,
      super.key});

  static showBottomSheet({
    required BuildContext context,
    required List<Widget> children,
    String title = "",
    bool isShowCloseButton = true,
    Function? handleWillPop,
    double widthImage = 200,
    double positionbottomImage = 6,
    String? imageTopPath,
  }) {
    return showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.transparent.withOpacity(0.0),
        isDismissible: false,
        enableDrag: isShowCloseButton,
        builder: (context) {
          return WillPopScope(
              onWillPop: () {
                if (handleWillPop != null) {
                  handleWillPop();
                  return Future.value(false);
                } else {
                  return Future.value(true);
                }
              },
              child: ModalBottomSheet(
                  isShowCloseButton: isShowCloseButton,
                  title: title,
                  widthImage: widthImage,
                  positionbottomImage: positionbottomImage,
                  imageTopPath: imageTopPath,
                  children: children));
        });
  }

  @override
  Widget build(BuildContext context) {
    _handleCliseBtnClose() {
      context.pop();
    }

    // TODO: implement build
    final double screenWidth = MediaQuery.of(context).size.width;
    return UnconstrainedBox(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              const SizedBox(
                height: 55,
              ),
              if (isShowCloseButton)
                Container(
                  height: 30,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(27),
                      topLeft: Radius.circular(27),
                    ),
                  ),
                ),
              Positioned(
                right: 20,
                bottom: 6,
                child: CloseOrangeBtn(
                  handleClick: _handleCliseBtnClose,
                ),
              ),
              if (imageTopPath != null)
                Positioned(
                  bottom: positionbottomImage,
                  child: imageTopPath!.endsWith("svg")
                      ? SvgPicture.asset(
                          imageTopPath!,
                          width: widthImage,
                        )
                      : Image.asset(
                          imageTopPath!,
                          width: widthImage,
                        ),
                ),
            ],
          ),
          Container(
            width: screenWidth,
            padding:
                const EdgeInsets.only(bottom: 56, top: 20, left: 35, right: 35),
            constraints: const BoxConstraints(minHeight: 170),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                ...children
              ],
            ),
          ),
        ],
      ),
    );
  }
}
