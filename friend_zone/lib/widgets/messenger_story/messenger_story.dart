import 'package:flutter/material.dart';
import 'package:friend_zone/utils/color_utils/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: friends.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
           
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/your_story.jpg'),
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "My Story",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          } else {
            final friend = friends[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(friend["image"]!),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    friend["name"]!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
