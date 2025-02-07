import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/features/splash_screen/splash_screen.dart';
import 'package:e_commerce_app/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen()
      },
    );
  }
}
