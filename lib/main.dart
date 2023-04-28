import 'package:flutter/material.dart';
import 'package:optuae/Screens/Splash.dart';
import 'constants/global_Keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyGlobalKeys.navigatorKey,
      home: Splash(),
    );
  }
}

