// import 'dart:async';
// import 'package:e_commerce_app/core/utils/app_assets.dart';
// import 'package:e_commerce_app/core/utils/app_colors.dart';
// import 'package:e_commerce_app/core/utils/app_routes.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: AppColors.primaryColor,
//           ),
//
//           Positioned(
//             top: 0,
//             child: Image.asset(
//               AppAssets.topCurve,
//               width: width,
//             ),
//           ),
//
//           Center(
//             child: Image.asset(
//               AppAssets.authRouteLogo,
//               width: width * 0.9,
//               height: height*0.3,
//             ),
//           ),
//
//           Positioned(
//             bottom: 0,
//             child: Image.asset(
//               AppAssets.bottomCurve,
//               width: width,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
