import 'package:flutter/material.dart';
import 'package:friend_zone/screens/explore_screen/explore_screen.dart';
import 'package:friend_zone/screens/friend_screen/friend_screen.dart';
import 'package:provider/provider.dart';

import '../../screens/add_post_screen/add_post_screen.dart';
import '../../screens/chat_screen/chat_screen.dart';
import '../../screens/dashboard_screen/dashboard_screen.dart';
import '../../view_model/controller/tab_controller/tab_controller.dart';

class DashboardScreen2 extends StatelessWidget {
  final List<Widget> screens = [
    DashboardScreen(),
    ExploreScreen(),
    AddPostScreen(),
    FriendScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          screens[provider.selectedIndex],
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0, provider),
          _buildNavItem(Icons.search, 1, provider),
          _buildCenterButton(provider),
          _buildNavItem(Icons.group, 3, provider),
          _buildNavItem(Icons.chat, 4, provider),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, TabProvider provider) {
    bool isSelected = provider.selectedIndex == index;
    return GestureDetector(
      onTap: () => provider.setSelectedIndex(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCenterButton(TabProvider provider) {
    return GestureDetector(
      onTap: () => provider.setSelectedIndex(2),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent,
            )
          ],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
