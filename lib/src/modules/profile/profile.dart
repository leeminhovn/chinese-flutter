import 'package:MochiChinese/src/components/oragnisms/wrap_popup_page.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:MochiChinese/src/modules/profile/screens/account.dart';
import 'package:MochiChinese/src/modules/profile/screens/not_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  final String redirectFrom;
  const Profile({this.redirectFrom = "", super.key});

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return WrapPopupPage(
      title: "PROFILE",
      backPage: widget.redirectFrom,
      child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (BuildContext context, state) {
              if (state.user == null) {
                return const NotLogin();
              }
              return Account(
                dataState: state,
              );
            },
          )),
    );
  }
}
