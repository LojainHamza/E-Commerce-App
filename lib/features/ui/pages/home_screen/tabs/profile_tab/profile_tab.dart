import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Welcome, Mohamed", style: AppStyles.medium18darkBlue),
                  IconButton(
                      onPressed: () {
                        //TODO: remove token
                        SharedPreferenceUtils.removeData(key: 'token');
                        //TODO: navigate to login
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.loginRoute, (route) => false);
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              Text("mohamed.N@gmail.com", style: AppStyles.light14Grey),
              SizedBox(height: 20.h),
              buildEditableField("Your full name", "Mohamed Mohamed Nabil"),
              buildEditableField("Your E-mail", "mohamed.N@gmail.com"),
              buildEditableField("Your password", "******************"),
              buildEditableField("Your mobile number", "01122118855"),
              buildEditableField("Your Address", "6th October, street 11...."),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditableField(String label, String suffixIcon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.medium18darkBlue),
        SizedBox(height: 10.h),
        TextFormField(
          initialValue: suffixIcon,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          ),
        ),
        SizedBox(height: 18.h)
      ],
    );
  }
}
