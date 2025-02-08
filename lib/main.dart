import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'features/ui/splash_screen/splash_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen()
      },
    );
  }
}
