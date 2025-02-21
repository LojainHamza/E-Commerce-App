import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  CartProductEntity productItem;

  CartItem({required this.productItem});

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
            CachedNetworkImage(
              width: 135.w,
              height: 145.h,
              fit: BoxFit.cover,
              imageUrl: productItem.product?.imageCover ?? '',
              imageBuilder: (context, url) {
                return CircleAvatar(
                  backgroundImage: url,
                  radius: 10.r,
                );
              },
              placeholder: (context, url) {
                return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor));
              },
              errorWidget: (context, url, error) {
                return Icon(Icons.error, color: AppColors.redColor);
              },
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(productItem.product?.title ?? '',
                            style: AppStyles.medium18darkBlue,
                            overflow: TextOverflow.ellipsis),
                      ),
                      IconButton(
                          onPressed: () {
                            ToastMessage.toastMessage(
                                msg: 'Item deleted successfully',
                                backgroundColor: AppColors.greenColor,
                                textColor: AppColors.whiteColor);
                            CartViewModel.get(context).deleteItemsInCart(
                                productItem.product?.id ?? '');
                          },
                          icon: Icon(CupertinoIcons.delete))
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
                      Text('EGP ${productItem.price?.toDouble() ?? 0}',
                          style: AppStyles.medium18darkBlue),
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
                                  ToastMessage.toastMessage(
                                      msg:
                                          'Item count decremented successfully',
                                      backgroundColor: AppColors.greenColor,
                                      textColor: AppColors.whiteColor);
                                  int count = productItem.count!.toInt();
                                  count--;
                                  CartViewModel.get(context).updateCountInCart(
                                      productItem.product?.id ?? '', count);
                                },
                                child: Icon(Icons.remove_circle_outline,
                                    size: 20.sp, color: AppColors.whiteColor),
                              ),
                              SizedBox(width: 18.w),
                              Text(
                                productItem.count?.toString() ?? '',
                                style: AppStyles.medium20White,
                              ),
                              SizedBox(width: 18.w),
                              InkWell(
                                onTap: () {
                                  ToastMessage.toastMessage(
                                      msg:
                                          'Item count incremented successfully',
                                      backgroundColor: AppColors.greenColor,
                                      textColor: AppColors.whiteColor);
                                  int count = productItem.count!.toInt();
                                  count++;
                                  CartViewModel.get(context).updateCountInCart(
                                      productItem.product?.id ?? '', count);
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
