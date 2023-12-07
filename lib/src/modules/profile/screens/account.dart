import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:MochiChinese/core/constant/user_enum.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/user_avatar.dart';

class Account extends StatelessWidget {
  final UserState dataState;
  const Account({required this.dataState, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AccountSubscriptionStatus accountSubscriptionStatus =
        BlocProvider.of<UserCubit>(context).state.accountSubscriptionStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserAvatar(accountSubscriptionStatus: accountSubscriptionStatus),
        const SizedBox(
          height: 20,
        ),
        Text(
          dataState.user!.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        _rowInfo(
            AssetsManager.icons.icon_email, "Email: ", dataState.user!.email),
        const SizedBox(
          height: 10,
        ),
        _rowInfo(AssetsManager.icons.icon_calendar, "Activation date: ",
            dataState.user!.createdAt),
        const SizedBox(
          height: 10,
        ),
        if (accountSubscriptionStatus ==
            AccountSubscriptionStatus.premiumAccount)
          _rowInfo(AssetsManager.icons.icon_calendar_x, "Expiration date: ",
              dataState.user!.expired_day!),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => {BlocProvider.of<UserCubit>(context).logoutUser()},
              child: const Text(
                'Log out',
                style: TextStyle(
                    color: Color(0xffbdbdbd),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ))
      ],
    );
  }

  Widget _rowInfo(String icon, String label, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
