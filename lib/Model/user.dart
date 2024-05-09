// 通过 JSON 数据创建一个 User 实例
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // 从 JSON 数据创建一个 User 实例的工厂构造函数
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}
