import 'package:MochiChinese/config/router_config.dart';
import 'package:MochiChinese/core/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => CoursesCubit()),
          BlocProvider(create: (ctx) => UserCubit())
        ],
        child: MaterialApp.router(
          key: AppConstants.keyOfMaterial,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Quicksand"),
          routerConfig: routerConfig,
        ));
  }
}
