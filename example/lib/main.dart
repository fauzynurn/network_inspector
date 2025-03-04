import 'package:flutter/material.dart';
import 'package:network_inspector/network_inspector.dart';
import 'package:provider/provider.dart';

import 'common/navigation_service.dart';
import 'common/notification_helper.dart';
import 'presentation/controllers/main_provider.dart';
import 'presentation/pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkInspector.initialize();
  NotificationHelper.initialize();
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(
        context: context,
      ),
      builder: (context, child) => MaterialApp(
        title: 'Network inspector',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: MainPage.routeName,
        routes: NavigationService.routes,
      ),
    );
  }
}
