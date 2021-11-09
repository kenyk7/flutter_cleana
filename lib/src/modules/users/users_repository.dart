import 'package:flutter_cleana/src/modules/users/user_model.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
