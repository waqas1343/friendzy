import 'package:provider/provider.dart';

import '../../screens/friend_screen/friend_screen.dart';
import '../controller/tab_controller/tab_controller.dart';

final List<ChangeNotifierProvider> multiAppProviders = [
  ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
  ////////////////
  ChangeNotifierProvider<MatchProvider>(create: (_) => MatchProvider()),
];
