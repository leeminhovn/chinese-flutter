import 'package:MochiChinese/src/constant/assets_manager.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/user_avatar.dart';

class Account extends StatelessWidget {
  final UserState dataState;
  const Account({required this.dataState, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserAvatar(type: 0),
        SizedBox(
          height: 20,
        ),
        Text(
          dataState.user!.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        _rowInfo(
            AssetsManager.icons.icon_email, "Email: ", dataState.user!.email),
        SizedBox(
          height: 10,
        ),
        _rowInfo(AssetsManager.icons.icon_calendar, "Activation date: ",
            dataState.user!.createdAt),
        SizedBox(
          height: 10,
        ),
        Expanded(child: Text('123'))
      ],
    );
  }

  Widget _rowInfo(String icon, String label, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
