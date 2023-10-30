import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skywatch/app.dart';
import 'package:skywatch/core/inject/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Inject.init();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const App());
}
