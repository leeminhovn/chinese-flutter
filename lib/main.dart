import 'package:MochiChinese/config/router_config.dart';
import 'package:MochiChinese/core/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/learn/bloc/courses_cubit.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'model/hive/userInfo/userInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserInfoAdapter());
  await Hive.initFlutter();
  // Hive.init(appDocumentDirectory.path);
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
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => CoursesCubit()),
          BlocProvider(lazy: false, create: (ctx) => UserCubit())
        ],
        child: MaterialApp.router(
          key: AppConstants.keyOfMaterial,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Quicksand"),
          routerConfig: routerConfig,
        ));
  }
}
