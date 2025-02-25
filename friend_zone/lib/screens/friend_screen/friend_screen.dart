import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../utils/color_utils/app_colors.dart';

class MatchProvider extends ChangeNotifier {
  List<Map<String, dynamic>> matches = [
    {
      'name': 'James',
      'age': 20,
      'location': 'Hanover',
      'distance': '1.3 km away',
      'match': '100%',
      'image': 'assets/images/w_image.png'
    },
    {
      'name': 'Eddie',
      'age': 23,
      'location': 'Dortmund',
      'distance': '2 km away',
      'match': '94%',
      'image': 'assets/images/w_image.png'
    },
  ];
}

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBackground,
          title: Text(
            'Matches',
            style: textTheme.headlineMedium,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildIconWithText(
                        Icons.favorite, 'Likes', '32', textTheme),
                    SizedBox(width: 5.w),
                    _buildIconWithText(Icons.chat, 'Connect', '15', textTheme),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  'Your Matches 47',
                  style: textTheme.headlineSmall,
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  height: 60.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: provider.matches.length,
                    itemBuilder: (context, index) {
                      return _buildMatchCard(
                          provider.matches[index], context, textTheme);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithText(
      IconData icon, String text, String count, TextTheme textTheme) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 1.w),
          ),
          child: ClipOval(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/w_image.png',
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 6.w,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 1.h),
        Text(text, style: textTheme.titleMedium),
        Text(count, style: TextStyle(color: AppColors.primaryColor)),
      ],
    );
  }

  Widget _buildMatchCard(
      Map<String, dynamic> match, BuildContext context, TextTheme textTheme) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(color: AppColors.primaryColor, width: 1.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.w),
            child: Image.asset(
              match['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 6.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3.w),
                bottomRight: Radius.circular(3.w),
              ),
            ),
            child: Text(
              '${match['match']} Match',
              style: textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 2.h,
          left: 5.w,
          right: 3.w,
          child: Container(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      match['distance'],
                      style: textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  '${match['name']}, ${match['age']}',
                  style: textTheme.headlineSmall!.copyWith(
                    color: Colors.white70,
                  ),
                ),
                Center(
                  child: Text(
                    match['location'],
                    style: textTheme.bodySmall!.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
