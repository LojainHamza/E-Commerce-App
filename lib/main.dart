import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/pages/product_details/product_details_screen.dart';
import 'features/ui/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  String routeName;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<ProductTabViewModel>()),
    BlocProvider(create: (context) => getIt<CartViewModel>()),
  ], child: MyApp(routeName: routeName)));
}
class MyApp extends StatelessWidget {
  String routeName;

  MyApp({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.splashScreenRoute: (context) => SplashScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.productRoute: (context) => ProductDetailsScreen(),
            AppRoutes.cartRoute: (context) => CartScreen(),
          },
        );
      },
    );
  }
}
