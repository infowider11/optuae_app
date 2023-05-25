import 'package:flutter/material.dart';
import 'package:optuae/Screens/Splash.dart';
import 'package:optuae/services/onesignal.dart';
import 'constants/global_Keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initOneSignal('dc21c7b0-689b-4229-b87c-b1965bdb0437');
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

