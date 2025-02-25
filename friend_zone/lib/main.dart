import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard_screen/dashboard_screen.dart';
import 'utils/text_theme/text_theme.dart';
import 'view_model/multi_provider/multi_app_provider.dart';
import 'widgets/botton_navigation/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiAppProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: DashboardScreen2(),
      ),
    );
  }
}
