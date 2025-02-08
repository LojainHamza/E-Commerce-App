import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/app_validators.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 91.h,bottom: 10.h,left: 97.w,right: 97.w
              ),
              child: Image.asset(AppAssets.authRouteLogo),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Form(
                      key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Full Name',style: AppStyles.medium18White),
                            CustomTextField(
                              controller: fullNameController,
                              validator: AppValidators.validateFullName,
                              hintText: 'Enter Your Full Name',
                              hintStyle: AppStyles.light18Grey,
                              keyboardType: TextInputType.name,
                              isPassword: false,
                              isObscureText: false,
                              filledColor: AppColors.whiteColor,
                            ),
                            Text('Mobile Number',style: AppStyles.medium18White),
                            CustomTextField(
                              controller: phoneController,
                              validator: AppValidators.validatePhoneNumber,
                              hintText: 'Enter Your Mobile Number',
                              hintStyle: AppStyles.light18Grey,
                              keyboardType: TextInputType.phone,
                              isPassword: false,
                              isObscureText: false,
                              filledColor: AppColors.whiteColor,
                            ),
                            Text('E-mail Address',style: AppStyles.medium18White),
                            CustomTextField(
                              controller: emailController,
                              validator: AppValidators.validateEmail,
                              hintText: 'Enter Your Email Address',
                              hintStyle: AppStyles.light18Grey,
                              keyboardType: TextInputType.emailAddress,
                              isPassword: false,
                              isObscureText: false,
                              filledColor: AppColors.whiteColor,
                            ),
                            Text('Password',style: AppStyles.medium18White),
                            CustomTextField(
                              controller: passwordController,
                              validator: AppValidators.validatePassword,
                              hintText: 'Enter Your Password',
                              hintStyle: AppStyles.light18Grey,
                              keyboardType: TextInputType.name,
                              isPassword: true,
                              isObscureText: true,
                              filledColor: AppColors.whiteColor,
                              suffixIcon: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.visibility_off)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 35.h),
                            child: CustomElevatedButton(
                                text: 'Sign Up',
                                textStyle: AppStyles.semiBold20Primary,
                                backgroundColor: AppColors.whiteColor,
                                onPressed: (){
                                  register();
                                })
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 30.h,bottom: 30.h),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text('Already have an account? Login',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                          style: AppStyles.medium18White,
                                          maxLines: 1,
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void register() {
    if(formKey.currentState!.validate()){
      print('Register Successfully');
    }
  }
}
