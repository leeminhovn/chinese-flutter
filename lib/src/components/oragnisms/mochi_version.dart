import 'package:MochiChinese/core/constant/app_constants.dart';
import 'package:flutter/cupertino.dart';

class MochiVersion extends StatelessWidget {
  const MochiVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "© Mochi Chinese ver${AppConstants.mochiVersion}",
      style: const TextStyle(
          color: Color(0xffff9600), fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
