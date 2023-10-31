import 'package:MochiChinese/src/modules/home/screens/screen_not_have_word_learn.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(child: ScreenNotHaveWordLearn());
  }
}
