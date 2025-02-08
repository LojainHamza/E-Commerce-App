import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_validators.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errors.errorMessage,
              title: 'Error',
              posActionName: 'Ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'Ok');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 10.h, left: 97.w, right: 97.w),
                child: Image.asset(AppAssets.authRouteLogo),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                          key: widget.viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Full Name', style: AppStyles.medium18White),
                              CustomTextField(
                                controller: widget.viewModel.fullNameController,
                                validator: AppValidators.validateFullName,
                                hintText: 'Enter Your Full Name',
                                hintStyle: AppStyles.light18Grey,
                                style: AppStyles.medium18White,
                                keyboardType: TextInputType.name,
                                cursorColor: AppColors.greyColor,
                                isPassword: false,
                                isObscureText: false,
                                filledColor: AppColors.whiteColor,
                              ),
                              Text('Mobile Number',
                                  style: AppStyles.medium18White),
                              CustomTextField(
                                controller: widget.viewModel.phoneController,
                                validator: AppValidators.validatePhoneNumber,
                                hintText: 'Enter Your Mobile Number',
                                hintStyle: AppStyles.light18Grey,
                                style: AppStyles.medium18White,
                                keyboardType: TextInputType.phone,
                                cursorColor: AppColors.greyColor,
                                isPassword: false,
                                isObscureText: false,
                                filledColor: AppColors.whiteColor,
                              ),
                              Text('E-mail Address',
                                  style: AppStyles.medium18White),
                              CustomTextField(
                                controller: widget.viewModel.emailController,
                                validator: AppValidators.validateEmail,
                                hintText: 'Enter Your Email Address',
                                style: AppStyles.medium18White,
                                hintStyle: AppStyles.light18Grey,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppColors.greyColor,
                                isPassword: false,
                                isObscureText: false,
                                filledColor: AppColors.whiteColor,
                              ),
                              Text('Password', style: AppStyles.medium18White),
                              CustomTextField(
                                controller: widget.viewModel.passwordController,
                                validator: AppValidators.validatePassword,
                                hintText: 'Enter Your Password',
                                hintStyle: AppStyles.light18Grey,
                                style: AppStyles.medium18White,
                                keyboardType: TextInputType.text,
                                cursorColor: AppColors.greyColor,
                                isPassword: true,
                                isObscureText: true,
                                filledColor: AppColors.whiteColor,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Text('Confirm Password',
                                  style: AppStyles.medium18White),
                              CustomTextField(
                                controller:
                                    widget.viewModel.rePasswordController,
                                validator: AppValidators.validatePassword,
                                hintText: 'Re-Enter Your Password',
                                hintStyle: AppStyles.light18Grey,
                                style: AppStyles.medium18White,
                                keyboardType: TextInputType.text,
                                cursorColor: AppColors.greyColor,
                                isPassword: true,
                                isObscureText: true,
                                filledColor: AppColors.whiteColor,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 35.h),
                                  child: CustomElevatedButton(
                                      text: 'Sign Up',
                                      textStyle: AppStyles.semiBold20Primary,
                                      backgroundColor: AppColors.whiteColor,
                                      onPressed: () {
                                        widget.viewModel.register();
                                      })),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 30.h, bottom: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    //Todo: Navigation
                                    // Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Already have an account? Login',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyles.medium18White,
                                        maxLines: 1,
                                      ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
