import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    {
      'name': 'Eddie',
      'age': 23,
      'location': 'Dortmund',
      'distance': '2 km away',
      'match': '94%',
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
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildIconWithText(Icons.favorite, 'Likes', '32'),
                SizedBox(
                  width: 20,
                ),
                _buildIconWithText(Icons.chat, 'Connect', '15'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Your Matches 47',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildMatchCard(provider.matches[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text, String count) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4), // Border ke liye spacing
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 3), // Circular Border
          ),
          child: ClipOval(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/w_image.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter:
                        ImageFilter.blur(sigmaX: 6, sigmaY: 6), // Blur Effect
                    child: Container(
                      color: Colors.white.withOpacity(0.2), // Light Overlay
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(count, style: const TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildMatchCard(Map<String, dynamic> match) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue, width: 3), // Border Added
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              match['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// Match Percentage Tag (Top Left)
        Positioned(
          left: 25,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              '${match['match']} Match',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        /// Match Details (Bottom)
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${match['name']}, ${match['age']}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  match['location'],
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  match['distance'],
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
