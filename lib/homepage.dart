import 'package:flutter/material.dart';
import 'package:unplash/Model/home_model.dart';
import 'package:unplash/Model/photo.dart';
import 'package:unplash/ViewModel/userservice.dart';
class HomePageWidget extends StatefulWidget {

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  late Future<PhotoModel> _futurePhoto;

  @override
  void initState() {
    super.initState();
    _futurePhoto = UserService().fetchPhotos();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<PhotoModel>(
        future: _futurePhoto,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(
              child: Image.network(
                snapshot.data!.urls.raw,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Center(child: Text('No users found'));
          }
        },
      ),
    );
  }
}
 
 // Path: lib/profile.dart