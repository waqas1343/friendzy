import 'package:flutter/material.dart';
import 'package:friend_zone/utils/app_images/app_images.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.mountainImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_nature, color: Colors.green, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "Travel",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 10,
            right: 80,
            child: Text(
              "If you could live anywhere in the world, where would you pick?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.waqasImage),
                  radius: 24,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Miranda Kehlani",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text("STUTTGART",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 60,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _floatingButton(Icons.thumb_up_alt_outlined),
                  SizedBox(height: 10),
                  _floatingButton(Icons.chat_bubble_outline),
                  SizedBox(height: 10),
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
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
