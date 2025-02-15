import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 1;
  int selectedSize = 40;
  int selectedColor = 0;
  List<int> sizes = [38, 39, 40, 41, 42];
  List<Color> colors = [Colors.black, Colors.red, Colors.blue, Colors.green];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          title: Text('Product Details', style: AppStyles.medium20darkBlue),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  color: AppColors.primaryColor, size: 30.sp),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart,
                  color: AppColors.primaryColor, size: 30.sp),
            ),
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 22.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ImageSlideshow(
                indicatorColor: AppColors.primaryColor,
                initialPage: 0,
                indicatorBottomPadding: 15.h,
                indicatorPadding: 8.w,
                indicatorRadius: 5.r,
                isLoop: true,
                autoPlayInterval: 3000,
                children: args.images!.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 120.h,
                      fit: BoxFit.fitHeight,
                      imageUrl: url,
                      placeholder: (context, url) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.yellowColor),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Icon(Icons.error, color: AppColors.redColor);
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(args.title ?? '',
                          style: AppStyles.medium18darkBlue)),
                  Text('EGP ${args.price}', style: AppStyles.medium18darkBlue)
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor.withAlpha(200),
                            width: 1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      child: Text('${args.sold} sold',
                          style: AppStyles.medium14darkBlue,
                          overflow: TextOverflow.ellipsis)),
                  SizedBox(width: 16.w),
                  Icon(Icons.star, color: AppColors.yellowColor, size: 25.sp),
                  SizedBox(width: 5.w),
                  Expanded(
                      child: Text(
                          '${args.ratingsAverage} (${args.ratingsQuantity})',
                          style: AppStyles.regular14darkBlue,
                          overflow: TextOverflow.ellipsis)),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
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
                ],
              ),
              SizedBox(height: 24.h),
              Text('Description', style: AppStyles.medium18darkBlue),
              SizedBox(height: 8.h),
              ReadMoreText(
                args.description ?? '',
                style: AppStyles.medium14darkBlue,
                trimExpandedText: 'Read Less',
                trimCollapsedText: 'Read More',
                trimLines: 2,
                trimMode: TrimMode.Line,
                colorClickableText: AppColors.greyColor,
              ),
              SizedBox(height: 16.h),
              Text('Size', style: AppStyles.medium18darkBlue),
              SizedBox(height: 8.h),
              Row(
                children: sizes.map((size) {
                  return GestureDetector(
                    onTap: () => setState(() => selectedSize = size),
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: selectedSize == size
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Text('$size',
                          style: TextStyle(
                              color: selectedSize == size
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24.h),
              Text('Color', style: AppStyles.medium18darkBlue),
              SizedBox(height: 10.h),
              Row(
                children: List.generate(colors.length, (index) {
                  return GestureDetector(
                    onTap: () => setState(() => selectedColor = index),
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                        border: Border.all(
                            color: selectedColor == index
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            width: 2),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 24.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Price',
                        style: AppStyles.medium18darkBlue.copyWith(
                            color: AppColors.primaryColor.withAlpha(200))),
                    SizedBox(height: 12.h),
                    Text('EGP ${args.price}',
                        style: AppStyles.medium18darkBlue),
                  ],
                ),
                SizedBox(width: 33.w),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.h)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_shopping_cart,
                                color: AppColors.whiteColor),
                            SizedBox(width: 12.w),
                            AutoSizeText('Add To Cart',
                                style: AppStyles.medium20White),
                            SizedBox(width: 22.w)
                          ],
                        )))
              ])
            ])));
  }
}
