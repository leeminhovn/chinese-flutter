import 'package:MochiChinese/src/components/oragnisms/wrap_popup_page.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  final String redirectFrom;
  const Profile({required this.redirectFrom, super.key});

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return WrapPopupPage(
        title: "Profile",
        backPage: widget.redirectFrom,
        child: Column(
          children: [],
        ));
  }
}
