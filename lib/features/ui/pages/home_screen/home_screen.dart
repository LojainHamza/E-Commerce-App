import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(viewModel.selectedIndex),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w
            ),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: viewModel.bottomNavOnTap,
                iconSize: 24.sp,
                items: [
                  bottomNavBarItemBuilder(
                      isSelected: viewModel.selectedIndex == 0,
                      selectedIcon: AppAssets.homeTabIconSelected,
                      unSelectedIcon: AppAssets.homeTabIcon
                  ),
                  bottomNavBarItemBuilder(
                      isSelected: viewModel.selectedIndex == 1,
                      selectedIcon: AppAssets.categoryTabIconSelected,
                      unSelectedIcon: AppAssets.categoryTabIcon
                  ),
                  bottomNavBarItemBuilder(
                      isSelected: viewModel.selectedIndex == 2,
                      selectedIcon: AppAssets.favoritesTabIconSelected,
                      unSelectedIcon: AppAssets.favoritesTabIcon
                  ),
                  bottomNavBarItemBuilder(
                      isSelected: viewModel.selectedIndex == 3,
                      selectedIcon: AppAssets.profileTabIconSelected,
                      unSelectedIcon: AppAssets.profileTabIcon
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildCustomBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1
      ),
      borderRadius: BorderRadius.circular(50.r),
    );
  }

  PreferredSizeWidget buildAppBar(int index) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(AppAssets.smallRouteLogo,
                  width: 70.w, height: 30.h),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: AppStyles.regular14darkBlue,
                        cursorColor: AppColors.primaryColor,
                        onTap: () {
                          // todo: implement search logic
                        },
                        decoration: InputDecoration(
                          border: buildCustomBorder(),
                          focusedBorder: buildCustomBorder(),
                          contentPadding: EdgeInsets.all(16.h),
                          hintText: 'What Do You Search For ?',
                          hintStyle: AppStyles.light14Grey,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30.sp,
                            color: AppColors.primaryColor.withAlpha(160),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index != 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.cartRoute);
                          },
                          child: BlocBuilder<ProductTabViewModel,
                              ProductTabStates>(
                            builder: (context, state) {
                              return Badge(
                                alignment: AlignmentDirectional.topStart,
                                backgroundColor: AppColors.greenColor,
                                label: Text(ProductTabViewModel.get(context)
                                    .numberOfCartItems
                                    .toString()),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 32.sp,
                                  color: AppColors.primaryColor.withAlpha(200),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItemBuilder(
      {required bool isSelected, required String selectedIcon, required String unSelectedIcon}) {
    return BottomNavigationBarItem(
        icon: CircleAvatar(
          foregroundColor: isSelected ? AppColors.primaryColor : AppColors
              .whiteColor,
          backgroundColor: isSelected ? AppColors.whiteColor : Colors
              .transparent,
          radius: 22.r,
          child: Image.asset(
              isSelected ? selectedIcon : unSelectedIcon
          ),
        ),
        label: ''
    );
  }
}
