import 'package:get/state_manager.dart';
import 'package:flutter_cleana/src/modules/users/user_model.dart';
import 'package:flutter_cleana/src/modules/users/users_repository.dart';

class UsersCtrl extends GetxController {
  final UsersRepository usersRepository;
  UsersCtrl({required this.usersRepository});

  var loading = false.obs;

  RxInt counter = 0.obs;
  RxList<User> usersObs = <User>[].obs;

  List<User> _users = [];
  List<User> get users => _users;

  @override
  void onReady() {
    loadUsers();
    super.onReady();
  }

  Future<void> loadUsers() async {
    loading.value = true;
    _users = await usersRepository.getUsers();
    loading.value = false;
    counter.value = _users.length;
    update(['users']); // use with getbuilder
  }

  toggleFav(User user) {
    final userf = _users.firstWhere((el) => el == user);
    userf.isFav = !user.isFav;
    if (user.isFav) {
      usersObs.add(userf);
    } else {
      usersObs.remove(userf);
    }
    update(['users']);
  }
}
