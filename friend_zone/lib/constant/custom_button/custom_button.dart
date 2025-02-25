import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final Color color;
  final Color textColor;
  final String iconPath;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 200,
    this.color = AppColors.darkTextColor,
    required this.textColor,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              child: SvgPicture.asset(
                iconPath,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(width: 35),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
