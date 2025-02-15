import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity product;

  ProductTabItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: AppColors.primaryColor.withAlpha(200), width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 190.w,
                  height: 120.h,
                  fit: BoxFit.fitHeight,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor)),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.redColor),
                ),
              ),
              Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 20.r,
                    child: Center(
                      child: IconButton(
                        color: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                        iconSize: 30.r,
                        onPressed: () {
                          //TODO: add to favorites
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: product.title ?? '',
                    textStyle: AppStyles.regular14darkBlue),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    CustomText(
                        text: 'EGP ${product.price}',
                        textStyle: AppStyles.regular14darkBlue),
                    SizedBox(width: 8.w),
                    CustomText(
                        text: 'EGP ${product.price! * 2}',
                        textStyle: AppStyles.regular11Grey
                            .copyWith(decoration: TextDecoration.lineThrough))
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    CustomText(
                        text: 'Review (${product.ratingsAverage})',
                        textStyle: AppStyles.regular12darkBlue),
                    SizedBox(width: 2.w),
                    Icon(Icons.star, color: AppColors.yellowColor, size: 25.sp),
                    Spacer(flex: 1),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // TODO: add to cart
                      },
                      child: Icon(Icons.add_circle,
                          color: AppColors.primaryColor, size: 32.sp),
                    )
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
