import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          buildAnnouncement(
            images: viewModel.imagesList,
          ),
          SizedBox(height: 24.h),
          lineBreak(name: 'Categories'),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllCategories,
            buildWhen: (previous, current) {
              return current is CategoryLoadingState ||
                  current is CategoryErrorState ||
                  current is CategorySuccessState;
            },
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor));
              } else if (state is CategoryErrorState) {
                return Center(child: Text(state.failures.errorMessage));
              } else if (state is CategorySuccessState) {
                return buildCategoryBrandSection(
                    list: state.categoryResponseEntity.data!);
              }
              return Container();
            },
          ),
          lineBreak(name: 'Brands'),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllBrands,
            buildWhen: (previous, current) {
              return current is BrandLoadingState ||
                  current is BrandErrorState ||
                  current is BrandSuccessState;
            },
            builder: (context, state) {
              if (state is BrandLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor));
              } else if (state is BrandErrorState) {
                return Center(child: Text(state.failures.errorMessage));
              } else if (state is BrandSuccessState) {
                return buildCategoryBrandSection(
                    list: state.brandResponseEntity.data!);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  ImageSlideshow buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5.0,
      children: images.map((image) => Image.asset(image)).toList(),
    );
  }

  Widget lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18darkBlue),
        TextButton(
            onPressed: () {
              // todo: navigate to view all
            },
            child: Text('View ALl', style: AppStyles.regular12darkBlue))
      ],
    );
  }

  SizedBox buildCategoryBrandSection(
      {required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 10.h),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryBrandItem(item: list[index]);
          }),
    );
  }
}