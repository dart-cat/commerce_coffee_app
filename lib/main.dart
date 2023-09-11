import 'package:coffee_app/models/coffee_shop.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/pages/shop_page.dart';
import 'package:coffee_app/services/firebase_streem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/profile_page/account_screen.dart';
import 'pages/profile_page/login_screen.dart';
import 'pages/profile_page/reset_password.dart';
import 'pages/profile_page/signup_screen.dart';
import 'pages/profile_page/verify_email.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CofeeApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class CofeeApp extends StatelessWidget {
  const CofeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        routes: {
          '/': (context) => const HomePage(),
          '/home': (context) => const ShopPage(),
          '/account': (context) => const AccountScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/reset_password': (context) => const ResetPasswordScreen(),
          '/verify_email': (context) => const VerifyEmailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
