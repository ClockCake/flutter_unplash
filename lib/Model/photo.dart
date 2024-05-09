// 作用: 用于定义图片模型类
//根据Json生成模型类
class PhotoModel{
  final String id;
  final String createdAt;
  final String updatedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final int downloads;
  final int likes;
  final bool likedByUser;
  final String description;
  final Exif exif;
  final List<CurrentUserCollections> currentUserCollections;
  final Urls urls;

  PhotoModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.downloads,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.exif,
    required this.currentUserCollections,
    required this.urls,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      downloads: json['downloads'],
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      description: json['description'],
      exif: Exif.fromJson(json['exif']),
      currentUserCollections: List<CurrentUserCollections>.from(json['current_user_collections'].map((x) => CurrentUserCollections.fromJson(x))),
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

class Exif {
  final String make;
  final String model;
  final String exposureTime;
  final String aperture;
  final String focalLength;
  final int iso;

  Exif({
    required this.make,
    required this.model,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json){
    return Exif(
      make: json['make'],
      model: json['model'],
      exposureTime: json['exposure_time'],
      aperture: json['aperture'],
      focalLength: json['focal_length'],
      iso: json['iso'],
    );
  }
}

class CurrentUserCollections {
  final int id;
  final String title;
  final String publishedAt;
  final String lastCollectedAt;
  final String updatedAt;
  final dynamic coverPhoto;
  final dynamic user;

  CurrentUserCollections({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    required this.coverPhoto,
    required this.user,
  });

  factory CurrentUserCollections.fromJson(Map<String, dynamic> json){
    return CurrentUserCollections(
      id: json['id'],
      title: json['title'],
      publishedAt: json['published_at'],
      lastCollectedAt: json['last_collected_at'],
      updatedAt: json['updated_at'],
      coverPhoto: json['cover_photo'],
      user: json['user'],
    );
  }
}