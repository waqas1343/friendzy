import 'package:flutter/material.dart';
import 'package:friend_zone/utils/app_images/app_images.dart';
import 'package:sizer/sizer.dart';

class MessengerStoriesList extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {
      "name": "Selena",
      "image": "https://randomuser.me/api/portraits/women/1.jpg"
    },
    {
      "name": "Clara",
      "image": "https://randomuser.me/api/portraits/women/2.jpg"
    },
    {
      "name": "Fabian",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "George",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];

  MessengerStoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 12.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: friends.length + 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0.3.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 0.5.w),
                      ),
                      child: CircleAvatar(
                        radius: 4.h,
                        backgroundImage: index == 0
                            ? const AssetImage(AppImages.waqasImage)
                                as ImageProvider
                            : NetworkImage(friends[index - 1]["image"]!),
                      ),
                    ),
                    if (index == 0)
                      CircleAvatar(
                        radius: 1.8.h,
                        backgroundColor: Colors.blue,
                        child:
                            Icon(Icons.add, color: Colors.white, size: 1.8.h),
                      ),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  index == 0 ? "My Story" : friends[index - 1]["name"]!,
                  style: textTheme.titleMedium?.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
