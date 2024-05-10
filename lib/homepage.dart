import 'package:flutter/material.dart';
import 'package:unplash/Model/photo.dart';
import 'package:unplash/ViewModel/userservice.dart';
class HomePageWidget extends StatefulWidget {

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  PhotoModel? _photo;

  @override
  void initState() {
    super.initState();
    UserService().fetchPhotos().then((photo) {
      setState(() {
        _photo = photo;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash'),
      ),
      body: _photo == null
        ? Center(child: CircularProgressIndicator())
        : Center(
            child: Image.network(
              _photo!.urls.raw,
              fit: BoxFit.cover,
            ),
          ),
    );
    
  }
}
 
