// 作用: 用于定义图片模型类
//根据Json生成模型类
class PhotoModel{
  // final String id;
  // final String createdAt;
  // final String updatedAt;
  // final int width;
  // final int height;
  // final String description;
  final Urls urls;

  PhotoModel({
    // required this.id,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.width,
    // required this.height,

    // required this.description,

    required this.urls,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
      // id: json['id'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      // width: json['width'],
      // height: json['height'],
      // description: json['description'],
      urls: Urls.fromJson(json['urls']),
    );
  }
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json){
    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}