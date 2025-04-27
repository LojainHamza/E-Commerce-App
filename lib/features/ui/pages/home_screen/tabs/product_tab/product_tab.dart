import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductTabViewModel, ProductTabStates>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          ToastMessage.toastMessage(
              msg: 'Product Added Successfully',
              backgroundColor: AppColors.greenColor,
              textColor: AppColors.whiteColor);
        } else if (state is AddToCartErrorState) {
          ToastMessage.toastMessage(
              msg: state.failures.errorMessage,
              backgroundColor: AppColors.redColor,
              textColor: AppColors.whiteColor);
        }
      },
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        bloc: viewModel..getAllProducts(),
        builder: (context, state) {
          if (state is ProductTabErrorState) {
            return Center(child: Text(state.failures.errorMessage));
          } else if (state is ProductTabSuccessState) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 2.6.h,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.h),
                          itemCount: state.responseEntity.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.productRoute,
                                    arguments:
                                        state.responseEntity.data![index]);
                              },
                              child: ProductTabItem(
                                  product: state.responseEntity.data![index]),
                            );
                          })),
                ],
              ),
            );
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
// return viewModel.productsList.isEmpty
        //     ? Center(
        //         child: CircularProgressIndicator(color: AppColors.primaryColor))
        //     : SafeArea(
        //         child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Expanded(
        //               child: GridView.builder(
        //                   gridDelegate:
        //                       SliverGridDelegateWithFixedCrossAxisCount(
        //                           crossAxisCount: 2,
        //                           childAspectRatio: 2 / 2.6.h,
        //                           crossAxisSpacing: 16.w,
        //                           mainAxisSpacing: 16.h),
        //                   itemCount: 10,
        //                   itemBuilder: (context, index) {
        //                     return InkWell(
        //                       onTap: () {
        //                         //TODO: navigate to product details screen
        //                         Navigator.pushNamed(
        //                             context, AppRoutes.productRoute);
        //                       },
        //                       child: ProductTabItem(),
        //                     );
        //                   })),
        //         ],
        //       ));
