import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              width: double.infinity,
              height: 10.h,
              fit: BoxFit.cover,
              imageUrl: 'https://www.wavetransit.com/wp-content/uploads/2021/08/Facebook-logo.png',
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50.r,
                );
              },
              placeholder: (context, url) {
                return Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor));
              },
              errorWidget: (context, url, error) {
                return Icon(Icons.error, color: AppColors.redColor);
              },
            )
        ),
        Expanded(
            flex: 4,
            child: Text(
                'Technology',
                textWidthBasis: TextWidthBasis.longestLine,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppStyles.regular14darkBlue
            )
        )
      ],
    );
  }
}
