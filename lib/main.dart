import 'package:MochiChinese/config/router_config.dart';
import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void dispose() {
    print("dispose main");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (ctx) => CoursesCubit())],
        child: MaterialApp.router(
          key: AppConstants.keyOfMaterial,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Quicksand"),
          routerConfig: routerConfig,
        ));
  }
}
