import 'package:MochiChinese/src/modules/auth/signup/screens/signup_email_method.dart';
import 'package:MochiChinese/src/modules/auth/signup/screens/signup_social_method.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final String backPage;
  const Signup({this.backPage = "", super.key});

  @override
  State<StatefulWidget> createState() => _Signup();
}

class _Signup extends State<Signup> {
  bool showScreenEmail = false;
  _handleShowToggle() {
    setState(() {
      showScreenEmail = !showScreenEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !showScreenEmail
        ? SignupSocialMethod(
            backPage: widget.backPage, handleShowToggle: _handleShowToggle)
        : SignupEmailMethod(handleShowToggle: _handleShowToggle);
  }
}
