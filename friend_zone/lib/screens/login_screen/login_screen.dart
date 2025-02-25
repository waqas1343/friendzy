import 'package:flutter/material.dart';
import 'package:friend_zone/constant/custom_button/custom_button.dart';
import 'package:friend_zone/constant/custom_text/custom_text.dart';
import 'package:friend_zone/utils/app_images/app_images.dart';
import 'package:friend_zone/utils/app_strings/app_strings.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';
import 'package:friend_zone/utils/text_theme/app_icon/app_icons.dart';
import 'package:friend_zone/widgets/botton_navigation/bottom_navigation.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; 

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 17.h),
                Image.asset(AppImages.loginImage),
                SizedBox(height: 3.h),
                CustomText(
                  text: AppStrings.meetNewPeople,
                  style: textTheme.headlineMedium,
                ),
                SizedBox(height: 5.h),

              
                CustomButton(
                  text: AppStrings.loginWithPhone,
                  textColor: AppColors.appBackground,
                  iconPath: AppIcons.phoneIcon,
                  width: 80.w,
                  color: AppColors.primaryColor,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen2()),
                    );
                  },
                ),

                SizedBox(height: 2.5.h),

                CustomButton(
                  text: AppStrings.loginWithGoogle,
                  textColor: AppColors.blackTextClr,
                  iconPath: AppIcons.googleIcon,
                  width: 80.w,
                  color: AppColors.btnColor,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen2()),
                    );
                  },
                ),
                SizedBox(height: 4.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppStrings.dontHaveAccount,
                      style: textTheme.titleMedium,
                    ),
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen2()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: AppStrings.signUp,
                          style: textTheme.titleSmall?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
