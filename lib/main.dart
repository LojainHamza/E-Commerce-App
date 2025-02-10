import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/splash_screen/splash_screen.dart';

void main(){
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreenRoute,
          routes: {
            AppRoutes.splashScreenRoute: (context) => SplashScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.loginRoute: (context) => LoginScreen(),
            // AppRoutes.homeRoute: (context) => HomeScreen(),
            // AppRoutes.productRoute: (context) => ProductDetailsScreen(),
            // AppRoutes.cartRoute: (context) => CartScreen(),
          },
        );
      },
    );
  }
}
