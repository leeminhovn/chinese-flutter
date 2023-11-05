import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'buttons/circle_back_button.dart';

class WrapPopupPage extends StatelessWidget {
  final Widget child;
  final String title;
  final String backPage;
  const WrapPopupPage(
      {this.title = "",
      required this.backPage,
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
              // Để chuyển hướng đến một trang khác, bạn có thể sử dụng Navigator
              context.go(backPage);
              // Trả về false để ngăn chặn việc thoát khỏi trang hiện tại
              return false;
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
                          child: CircleBackButton(backPage: backPage)),
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
