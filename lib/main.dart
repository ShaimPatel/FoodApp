import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ReviewCartProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
            primaryColor: AppColors.appprimaryColor,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
        home: const SplashScreen(),
      ),
    );
  }
}
