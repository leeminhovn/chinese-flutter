import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:MochiChinese/src/modules/profile/widgets/user_avatar.dart';
import 'package:flutter/cupertino.dart';

class NotLogin extends StatelessWidget {
  const NotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        UserAvatar(type: 0),
        SizedBox(
          height: 30,
        ),
        Button("CREATE AN ACCOUNT", height: 65, funcClick: () {}),
        SizedBox(
          height: 10,
        ),
        Button("LOGIN", height: 65, color: "green", funcClick: () {}),
      ],
    );
  }
}
