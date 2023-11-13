import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'buttons/circle_back_button.dart';

class WrapPopupPage extends StatelessWidget {
  final Widget child;
  final String title;
  final String backPage;
  final Function? otherActionBack;
  const WrapPopupPage(
      {this.title = "",
      this.backPage = "",
      this.otherActionBack,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WillPopScope(
            onWillPop: () async {
              // Xử lý logic nếu muốn chuyển hướng khi nhấn nút back
              if (otherActionBack != null) {
                otherActionBack!();
                return false;
              }
              if (backPage == "") {
                // context.pop();
                return true;
              }
              // Để chuyển hướng đến một trang khác, bạn có thể sử dụng Navigator
              else {
                context.go(backPage);
                return false;
              }
              // Trả về false để ngăn chặn việc thoát khỏi trang hiện tại
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(color: Color(0xffffcb08)),
                  height: 65,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CircleBackButton(
                              backPage: backPage,
                              otherActionBack: otherActionBack)),
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: child)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
