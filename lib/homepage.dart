import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:unplash/Model/photo.dart';
import 'package:unplash/ViewModel/APIService.dart';
import 'package:unplash/editorial.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(  // 添加 DefaultTabController
      length: 9, // 8个标签页
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Unsplash',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.9),
          bottom: TabBar( // 将 TabBar 放入 AppBar 的 bottom 属性中
          indicatorColor: Colors.white,
          isScrollable: true, // 可滚动
          tabs: [
            Tab(
              text: "Editorial",
            ),
            Tab(
              text: "Wallpapers",
            ),
            Tab(
              text: "Chinese girl",
            ),
            Tab(
              text: "Natural",
            ),
            Tab(
              text: "3D Renders",
            ),
              Tab(
              text: "Travel",
            ),
            Tab(
              text: "Textures & Patterns",
            ),
            Tab(
              text: "Architecture & Interiors",
            ),
            Tab(
              text: "Art & Abstract",
            )

          ],
          labelColor: Colors.white,
          //选中后字体大小加粗
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView( // 添加 TabBarView
          children: [
            EditorialWidget(query: 'Editorial'),
            EditorialWidget(query: 'Wallpapers'),
            EditorialWidget(query: 'Chinese girl'),
            EditorialWidget(query: 'Natural'),
            EditorialWidget(query: '3D Renders'),
            EditorialWidget(query: 'Travel'),
            EditorialWidget(query: 'Textures & Patterns'),
            EditorialWidget(query: 'Architecture & Interiors'),
            EditorialWidget(query: 'Art & Abstract'),

          ],
        ),
      ),
    );
  }
}
