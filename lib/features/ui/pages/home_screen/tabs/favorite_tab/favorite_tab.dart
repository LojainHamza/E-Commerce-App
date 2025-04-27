import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteTabViewModel, GetUserWishlistStates>(
        bloc: FavoriteTabViewModel.get(context)..getUserWishlist(),
        builder: (context, state) {
          if (state is GetUserWishlistLoadingState) {
            return Center(
                child:
                    CircularProgressIndicator(color: AppColors.primaryColor));
          } else if (state is GetUserWishlistErrorState) {
            return Center(child: Text(state.failures.errorMessage));
          } else if (state is GetUserWishlistSuccessState) {
            if (state.responseEntity.data!.isEmpty) {
              return Center(
                child: Text('Nothing to show in your wishlist',
                    style: AppStyles.semiBold20Primary),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: ListView(
                  children: state.responseEntity.data!.map((product) {
                    return Column(
                      children: [
                        buildWishlistItem(
                          context: context,
                          imageUrl: product.imageCover ?? '',
                          title: product.title ?? '',
                          price: product.price,
                          productId: product.id ?? '',
                        ),
                        SizedBox(height: 15.h), // إضافة مسافة بين العناصر
                      ],
                    );
                  }).toList(),
                ),
              );
            }
          } else if (state is AddToWishlistLoadingState ||
              state is RemoveFromWishlistLoadingState) {
            return Center(
                child:
                    CircularProgressIndicator(color: AppColors.primaryColor));
          } else if (state is AddToWishlistErrorState ||
              state is RemoveFromWishlistErrorState) {
            return Center(child: Text('Error'));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildWishlistItem({
    required BuildContext context,
    required String? imageUrl,
    required String? title,
    required num? price,
    required String? productId,
  }) {
    double finalPrice = price?.toDouble() ?? 0.0;
    double originalPrice = finalPrice * 2;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 135.w,
            height: 145.h,
            fit: BoxFit.cover,
            imageUrl: imageUrl ?? '',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.red),
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
                      child: Text(
                        title ?? '',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.delete),
                      onPressed: () async {
                        bool confirmDelete = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Remove Product',
                                style: AppStyles.medium18darkBlue),
                            content: Text(
                                'Are you sure you want to remove this product from your wishlist?',
                                style: AppStyles.medium18Grey),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text('Cancel',
                                    style: AppStyles.medium18darkBlue),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Yes',
                                    style: AppStyles.medium18darkBlue),
                              ),
                            ],
                          ),
                        );
                        if (confirmDelete == true) {
                          FavoriteTabViewModel.get(context)
                              .removeProductFromWishlist(productId ?? '');
                          await SharedPreferenceUtils.saveData(
                              key: 'isFavorite_$productId', value: false);
                          ToastMessage.toastMessage(
                              msg: 'Product removed from your wishlist',
                              backgroundColor: AppColors.greenColor,
                              textColor: AppColors.whiteColor);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 10.r,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Black Color | Size: 40',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EGP ${finalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'EGP ${originalPrice.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.greyColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h), // تقليل الـ Padding
                        ),
                        onPressed: () {
                          // TODO: Add product to cart
                          ProductTabViewModel.get(context)
                              .addToCart(productId ?? '');
                          ToastMessage.toastMessage(
                              msg: 'Product added to cart successfully',
                              backgroundColor: AppColors.greenColor,
                              textColor: AppColors.whiteColor);
                        },
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
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
    );
  }
}