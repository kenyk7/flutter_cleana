class Users {
  Users({
    required this.data,
  });

  List<User> data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );
}

class User {
  int id;
  String name;
  String email;
  bool isFav;
  String? avatar;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.isFav = false,
    this.avatar,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['first_name'],
        email: json['email'],
        avatar: json['avatar'],
      );
}
