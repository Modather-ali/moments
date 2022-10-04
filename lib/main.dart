import 'package:flutter/material.dart';
import 'package:moments/screens/home.dart';

import 'screens/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moments',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
        ),
        primarySwatch: Colors.indigo,
      ),
      home: sharedPreferences.getInt("id") == null
          ? const SignUpScreen()
          : const HomeScreen(),
    );
  }
}
