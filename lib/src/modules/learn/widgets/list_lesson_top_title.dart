import 'package:flutter/material.dart';

class ListLessonTopTitle extends StatelessWidget {
  const ListLessonTopTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
            constraints: BoxConstraints(minHeight: 56),
            decoration: const BoxDecoration(
                color: Color(0xfffb993b),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(255, 150, 0, 0.25),
                      offset: Offset(4, 6),
                      blurRadius: 10)
                ]),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: const Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Text(
                  "100 basic Chinese vocabulary",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1,
                    letterSpacing: 1,
                    fontFamily: "RifficFree",
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
