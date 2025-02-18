import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int productCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.greyColor, width: 2)),
        child: Row(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbsjnjcFxXYIJw2iUZyXcD5OjUNCfEQ6Jk0A&s',
              width: 135.w,
              height: 135.h,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nike Air Jordon',
                          style: AppStyles.medium18darkBlue),
                      IconButton(
                          onPressed: () {}, icon: Icon(CupertinoIcons.delete))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.black, radius: 10.r),
                      SizedBox(width: 10.w),
                      Text('Black | Size: 40', style: AppStyles.medium18Grey),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EGP 3,500', style: AppStyles.medium18darkBlue),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 8.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              color: AppColors.primaryColor),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  productCounter--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove_circle_outline,
                                    size: 20.sp, color: AppColors.whiteColor),
                              ),
                              SizedBox(width: 18.w),
                              AutoSizeText(
                                '$productCounter',
                                style: AppStyles.medium20White,
                              ),
                              SizedBox(width: 18.w),
                              InkWell(
                                onTap: () {
                                  productCounter++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add_circle_outline,
                                    size: 20.sp, color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
