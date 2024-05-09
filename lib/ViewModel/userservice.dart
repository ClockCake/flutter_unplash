import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:unplash/Model/photo.dart';

class UserService {
  final Dio _dio;

  UserService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://api.unsplash.com';
    _dio.options.headers = {
      'Authorization': 'Client-ID pv2GD11irotOA7TF3RwjD6qHgb35H7AI8LTtKRtBPrE'
    };

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to ${options.uri.toString()}');
        return handler.next(options); // 继续执行请求
      },
      onResponse: (response, handler) {
        print('Received response: ${response.data}');
        //改成log输出
        return handler.next(response); // 继续返回响应
      },
      onError: (DioError error, handler) {
        print('Request failed: ${error.message}');
        if (error.response != null) {
          print('Failed with status: ${error.response?.statusCode}');
          print('Failed response data: ${error.response?.data}');
        }
        return handler.next(error); // 继续处理错误
      },
    ));
  }

  // Get a random photo
  Future<PhotoModel> fetchPhotos() async {
    try {
      final response = await _dio.get('/photos/random');
      return PhotoModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load Photos');
    }
  }
}
