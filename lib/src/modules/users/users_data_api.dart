import 'package:dio/dio.dart';

import 'package:flutter_cleana/src/env.dart';
import 'package:flutter_cleana/src/modules/users/user_model.dart';
import 'package:flutter_cleana/src/modules/users/users_repository.dart';

class UsersDataApi extends UsersRepository {
  @override
  Future<List<User>> getUsers() async {
    print(env.config.apiUrl);
    try {
      var res = await Dio().get(env.config.apiUrl);
      final dt = res.data;
      final list = Users.fromJson(dt);
      return list.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
