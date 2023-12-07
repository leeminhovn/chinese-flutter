import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ScreenNotHaveWordNoteBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenNotHaveWordNoteBook();
}

class _ScreenNotHaveWordNoteBook extends State<ScreenNotHaveWordNoteBook> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.7,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Image.asset((AssetsManager.mochi.mochi_study_happy)),
            ),
          ),
          const Text(
            "You do not have any words in notebook yet.  Let's learn a new lesson",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Button("LEARN NEW WORDS", height: 65, funcClick: () {
            context.go(ApplicationRouteName.learn);
          }),
        ],
      ),
    );
  }
}
