import 'dart:convert';
import 'package:flutter/services.dart';


class HomeModel {
  final String? id;
  final String? title;
  final String? description;
  final String? image;

  HomeModel({this.id, this.title, this.description, this.image});

  // 从JSON创建新的HomeModel实例的工厂方法
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }



  // 从assets/data/data.json文件中读取数据
  static Future<List<HomeModel>> fetchHomeModel() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => HomeModel.fromJson(json)).toList();
  }
}




