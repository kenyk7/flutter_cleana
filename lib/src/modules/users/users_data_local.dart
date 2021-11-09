import 'package:flutter_cleana/src/modules/users/user_model.dart';
import 'package:flutter_cleana/src/modules/users/users_repository.dart';

final users = [
  User(id: 1, name: 'Keny', email: 'keny@gmail.com'),
  User(id: 1, name: 'Kalin', email: 'kalin@gmail.com'),
];

class UsersDataLocal extends UsersRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    return users;
  }
}
