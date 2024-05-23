import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unplash/bottom_navigation_bar.dart';
import 'package:unplash/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),  // 设计稿的尺寸
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Colors.transparent, 
          splashColor: Colors.transparent,
        ),
        home: BottomNavigationBarWidget(),
      ),
    );
  }
}

