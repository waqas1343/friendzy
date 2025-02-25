import 'package:flutter/material.dart';
import 'package:friend_zone/constant/custom_button/custom_button.dart';
import 'package:friend_zone/constant/custom_text/custom_text.dart';
import 'package:friend_zone/utils/app_images/app_images.dart';
import 'package:friend_zone/utils/app_strings/app_strings.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';
import 'package:friend_zone/utils/text_theme/app_icon/app_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset(AppImages.loginImage),
          SizedBox(
            height: 20,
          ),
          CustomText(
            text: AppStrings.meetNewPeople,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            text: AppStrings.loginWithPhone,
            textColor: AppColors.appBackground,
            iconPath: AppIcons.phoneIcon,
            width: 300,
            color: AppColors.primaryColor,
            onTap: () {},
          ),
          SizedBox(height: 20),
          CustomButton(
            text: AppStrings.loginWithGoogle,
            textColor: AppColors.blackTextClr,
            iconPath: AppIcons.googleIcon,
            width: 300,
            color: AppColors.btnColor,
            onTap: () {},
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppStrings.dontHaveAccount,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                child: CustomText(
                  text: AppStrings.signUp,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
