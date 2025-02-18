import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/cart_item.dart';
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartItem();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: AppStyles.medium18Grey,
                        ),
                        Text(
                          'EGP 17,500',
                          style: AppStyles.medium18darkBlue,
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 35.w),
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text('Checkout', style: AppStyles.medium18White),
                            SizedBox(width: 25.w),
                            Icon(Icons.arrow_forward,
                                color: AppColors.whiteColor)
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}