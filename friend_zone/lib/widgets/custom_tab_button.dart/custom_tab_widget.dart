import 'package:flutter/material.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../view_model/controller/tab_controller/tab_controller.dart';

class CustomTabButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, tabProvider, child) {
        return Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.btnColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              tabButton(context, "Make Friends", 0, tabProvider),
              tabButton(context, "Search Partners", 1, tabProvider),
            ],
          ),
        );
      },
    );
  }

  Widget tabButton(
      BuildContext context, String text, int index, TabProvider tabProvider) {
    bool isSelected = tabProvider.selectedIndex == index;
    return GestureDetector(
      onTap: () => tabProvider.setSelectedIndex(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
