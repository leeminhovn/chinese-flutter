import 'package:flutter/material.dart';

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
      color: const Color(0xfffff3e4),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(color: Color(0xffffcb08)),
                height: 65,
                child: Row(
                  children: [CircleBackButton(backPage: backPage)],
                ),
              ),
              Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
