import 'package:flutter/material.dart';

import './src/env.dart';
import './src/app.dart';

void main() {
  // flutter run --dart-define=ENV=prod
  const String env = String.fromEnvironment(
    'ENV',
    defaultValue: 'dev',
  );
  Env().init(env);
  runApp(const App());
}
