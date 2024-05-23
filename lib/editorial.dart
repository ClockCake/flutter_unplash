import 'package:flutter/material.dart';
import 'package:unplash/Model/photo.dart';
import 'package:unplash/ViewModel/APIService.dart';
class EditorialWidget extends StatefulWidget {
  final String query; // 声明字符串参数
  EditorialWidget({required this.query}); // 构造函数
  @override
  _EditorialWidgetState createState() => _EditorialWidgetState();
}
class _EditorialWidgetState extends State<EditorialWidget> {
  List<PhotoModel> _photos = [];
    //定义一个初始化状态
  void initState() {
    super.initState();
    APIService apiService = APIService();
    apiService.fetchPhotosByQuery(widget.query).then((photos) {
      setState(() {
        _photos = photos;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          //图片左下角 Text(name)
          return Image.network(_photos[index].urls.regular);
        },
      ),
    );
  }
}