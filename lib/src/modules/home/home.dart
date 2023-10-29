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
    return Column(
      children: [
        TextButton(
            onPressed: () => setState(() {
                  count++;
                }),
            child: Text(count.toString()))
      ],
    );
  }
}
