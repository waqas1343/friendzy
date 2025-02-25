import 'package:flutter/material.dart';
import 'package:friend_zone/utils/app_images/app_images.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.h),
            child: Image.asset(
              AppImages.mountainImage,
              width: double.infinity,
              height: 35.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 1.h,
            left: 1.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(3.h),
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_nature, color: Colors.green, size: 3.h),
                  SizedBox(width: 3.w),
                  Text(
                    "Travel",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 2.w,
            right: 20.w,
            child: Text(
              "If you could live anywhere in the world, where would you pick?",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Positioned(
            bottom: 2.h,
            left: 2.w,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.waqasImage),
                  radius: 3.h,
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Miranda Kehlani",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "STUTTGART",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 10.h,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  bottomLeft: Radius.circular(3.h),
                ),
              ),
              child: Column(
                children: [
                  _floatingButton(Icons.thumb_up_alt_outlined),
                  SizedBox(height: 1.h),
                  _floatingButton(Icons.chat_bubble_outline),
                  SizedBox(height: 1.h),
                  _floatingButton(Icons.more_horiz),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingButton(IconData icon) {
    return GestureDetector(
      onTap: () {
        print("Button Pressed: $icon");
      },
      child: Container(
        padding: EdgeInsets.all(1.5.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1.h,
              spreadRadius: 0.5.w,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 2.5.h),
      ),
    );
  }
}
