import 'package:flutter/material.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../view_model/controller/tab_controller/tab_controller.dart';

class CustomTabButtons extends StatelessWidget {
  const CustomTabButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabProvider>(context);
    return Container(
      padding: EdgeInsets.all(0.5.h),
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.circular(5.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          tabButton(context, "Make Friends", 0, provider),
          tabButton(context, "Search Partners", 1, provider),
        ],
      ),
    );
  }
}

Widget tabButton(
    BuildContext context, String text, int index, TabProvider tabProvider) {
  bool isSelected = tabProvider.selectedIndex == index;

  return GestureDetector(
    onTap: () => context.read<TabProvider>().setSelectedIndex(index),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(4.h),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black26,
                ),
              ]
            : [],
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
      ),
    ),
  );
}
