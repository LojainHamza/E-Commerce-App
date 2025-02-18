import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text('Cart', style: AppStyles.medium20darkBlue),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.search, color: AppColors.primaryColor, size: 30.sp),
              SizedBox(width: 10.w),
              Icon(Icons.shopping_cart,
                  color: AppColors.primaryColor, size: 30.sp),
              SizedBox(width: 10.w),
            ],
          )
        ],
      ),
    );
  }
}
