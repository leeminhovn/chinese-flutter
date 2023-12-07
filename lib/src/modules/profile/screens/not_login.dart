import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/core/constant/user_enum.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:MochiChinese/src/modules/profile/widgets/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class NotLogin extends StatelessWidget {
  const NotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const UserAvatar(
            accountSubscriptionStatus: AccountSubscriptionStatus.guestAccount),
        const SizedBox(
          height: 30,
        ),
        Button("CREATE AN ACCOUNT", height: 65, funcClick: () {
          context.push(
            ApplicationRouteName.signup,
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Button("LOGIN", height: 65, color: "green", funcClick: () {
          context.push(
            ApplicationRouteName.login,
          );
        }),
      ],
    );
  }
}
