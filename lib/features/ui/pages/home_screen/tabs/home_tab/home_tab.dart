import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            buildAnnouncement(
                images: [
                  AppAssets.advertisement1,
                  AppAssets.advertisement2,
                  AppAssets.advertisement3
                ]
            ),
            SizedBox(height: 24.h),
            lineBreak(name: 'Categories'),
            buildCategoryBrandSection(CategoryBrandItem()),
            lineBreak(name: 'Brands'),
            buildCategoryBrandSection(CategoryBrandItem()),
          ],
        )
    );
  }

  ImageSlideshow buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5.r,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        height: 190.h,
        children:
        images.map((url) {
          return Image.asset(
              url,
              fit: BoxFit.fill);
        }).toList()
    );
  }

  Widget lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18darkBlue),
        TextButton(onPressed: () {
          // todo: navigate to view all
        },
            child: Text('View ALl', style: AppStyles.regular12darkBlue)
        )
      ],
    );
  }

  SizedBox buildCategoryBrandSection(Widget categoryBrand) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16.h, crossAxisSpacing: 10.h),
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return categoryBrand;
          }
      ),
    );
  }

}
