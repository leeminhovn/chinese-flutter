import 'package:flutter/material.dart';

void main() {
  runApp(const MochiChineseApp());
}

class MochiChineseApp extends StatefulWidget {
  const MochiChineseApp({super.key});

  @override
  State<StatefulWidget> createState() => _MochiChineseApp();
}

class _MochiChineseApp extends State<MochiChineseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Quicksand"),
      routerConfig: ,
    );
  }
}
