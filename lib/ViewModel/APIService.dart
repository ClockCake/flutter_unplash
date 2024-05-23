import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:unplash/Model/photo.dart';

class APIService {
  final Dio _dio;

  APIService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://api.unsplash.com';
    _dio.options.headers = {
      'Authorization': 'Client-ID pv2GD11irotOA7TF3RwjD6qHgb35H7AI8LTtKRtBPrE',
      // HttpHeaders.hostHeader: 'api.unsplash.com'  // 显式设置Host头
    };

        // 配置代理和忽略证书错误
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        // 修改为你的代理服务器地址和端口
        return 'PROXY 127.0.0.1:8888';
      };
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to ${options.uri.toString()}');
        return handler.next(options); // 继续执行请求
      },
      onResponse: (response, handler) {
        //打印返回结果
        print(jsonEncode(response.data));
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
      throw Exception('Failed to load Photos ');
    }
  }

  //Get a single page of photo results for a query.

  Future<List<PhotoModel>> fetchPhotosByQuery(String query) async {
    try {
      final response = await _dio.get('/search/photos', queryParameters: {
        'query': query,
        'per_page': 25,
        'page': 1,
      });
      return (response.data['results'] as List).map((json) => PhotoModel.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load Photos ');
    }
  }
}