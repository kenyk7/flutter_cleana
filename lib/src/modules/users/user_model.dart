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
  User({
    required this.id,
    required this.name,
    required this.email,
    this.isFav = false,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['first_name'],
        email: json['email'],
      );
}
