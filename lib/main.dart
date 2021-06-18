import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:workout/controller/category_controller.dart';
import 'package:workout/controller/dashboard_controller.dart';
import 'package:workout/view/Dashboard/dashboard_main.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CategoryController());
  Get.put(DashboardController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      allowFontScaling: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workout Go',
        home: Dashboard(),
      ),
    );
  }
}
