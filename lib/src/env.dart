abstract class BaseConfig {
  // String get apiGraphql;
  String get apiUrl;
}

class DevConfig implements BaseConfig {
  @override
  String get apiUrl =>
      'https://mocki.io/v1/e40463cc-5628-4241-a74b-07f352bc3a53';
}

class ProdConfig implements BaseConfig {
  @override
  String get apiUrl => 'https://reqres.in/api/users';
}

class Env {
  factory Env() {
    return _singleton;
  }
  Env._internal();
  static final Env _singleton = Env._internal();

  late String appEnv;
  late BaseConfig config;

  init(String env) {
    appEnv = env;
    config = env == 'prod' ? ProdConfig() : DevConfig();
  }
}

final env = Env();
