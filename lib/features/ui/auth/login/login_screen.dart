import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_validators.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(context: context, message: 'Waiting...');
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.errors.errorMessage,
                title: 'Error',
                posActionName: 'Ok');
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Login Successfully',
                title: 'Success',
                posActionName: 'Ok',
                posAction: () {
                  // TODO: save token
                  SharedPreferenceUtils.saveData(
                      key: 'token', value: state.responseEntity.token);
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.homeRoute);
                });
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 61.h, bottom: 57.h, left: 97.w, right: 97.w),
                      child: Image.asset(AppAssets.authRouteLogo),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AutoSizeText('Welcome Back To Route',
                              style: AppStyles.semiBold24White, maxLines: 1),
                          AutoSizeText('Please Sign In With Your Email',
                              style: AppStyles.light16White, maxLines: 1),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Form(
                                key: viewModel.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch,
                                  children: [
                                    Text('Email',
                                        style: AppStyles.medium18White),
                                    CustomTextField(
                                      controller: viewModel.emailController,
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
                                    Text('Password',
                                        style: AppStyles.medium18White),
                                    CustomTextField(
                                      controller: viewModel.passwordController,
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
                                    InkWell(
                                      onTap: () {},
                                      child: Text('Forget Password',
                                          style: AppStyles.regular18White,
                                          textAlign: TextAlign.end),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 35.h),
                                      child: CustomElevatedButton(
                                          text: 'Login',
                                          textStyle: AppStyles
                                              .semiBold20Primary,
                                          backgroundColor: AppColors.whiteColor,
                                          onPressed: viewModel.login),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                              AppRoutes.registerRoute);
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    'Don\'t Have An Account? Create Account',
                                                    style: AppStyles
                                                        .medium18White,
                                                    textAlign: TextAlign
                                                        .center))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
