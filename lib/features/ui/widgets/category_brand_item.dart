import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  CategoryEntity item;

  CategoryBrandItem({required this.item});

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
              imageUrl: item.image ?? '',
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
            child: Text(item.name ?? '',
                textWidthBasis: TextWidthBasis.longestLine,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppStyles.regular12darkBlue))
      ],
    );
  }
}
