import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  CartViewModel viewModel = getIt<CartViewModel>();

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
      body: BlocBuilder<CartViewModel, CartStates>(
        bloc: viewModel..getItemsInCart(),
        builder: (context, state) {
          if (state is GetCartSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.responseEntity.data!.products!.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                          productItem:
                              state.responseEntity.data!.products![index]);
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
                                'EGP ${state.responseEntity.data!.totalCartPrice!.toDouble()}',
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
                                  Text('Checkout',
                                      style: AppStyles.medium18White),
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
            );
          } else if (state is GetCartErrorState) {
            return Center(
                child: Text(state.failures.errorMessage,
                    style: AppStyles.medium18darkBlue));
          } else {
            return Center(
                child:
                    CircularProgressIndicator(color: AppColors.primaryColor));
          }
        },
      ),
    );
  }
}