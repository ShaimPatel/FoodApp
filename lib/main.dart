import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp/config/colors.dart';

import 'auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: appprimaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const SignIn(),
    );
  }
}
