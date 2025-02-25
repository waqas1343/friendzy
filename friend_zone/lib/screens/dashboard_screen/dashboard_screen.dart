import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friend_zone/constant/custom_text/custom_text.dart';
import 'package:friend_zone/utils/app_strings/app_strings.dart';
import 'package:friend_zone/utils/text_theme/app_icon/app_icons.dart';
import 'package:friend_zone/widgets/messenger_story/messenger_story.dart';

import '../../widgets/app_card/app_card.dart';
import '../../widgets/custom_tab_button.dart/custom_tab_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.appName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset(
                      AppIcons.notificationIcon,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MessengerStoriesList(),
              SizedBox(
                height: 10,
              ),
              CustomTabButtons(),
              SizedBox(
                height: 10,
              ),
              CustomCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
