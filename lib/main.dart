import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/presentation/pages/added.dart';
import 'package:serag_app/presentation/pages/home.dart';
import 'package:serag_app/presentation/pages/khetma.dart';
import 'package:serag_app/presentation/pages/privateKhetma.dart';
import 'package:serag_app/presentation/pages/splash.dart';
import 'package:serag_app/presentation/pages/thekr.dart';

void main() {
  runApp
  (
    DevicePreview(
      enabled:false,
      builder: (context)=> const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 812),
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          home: KhetmaPAge(),
        );
      },
    );
  }
}
