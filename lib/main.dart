import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FooderlichTheme.light(),
      darkTheme: FooderlichTheme.dark(),
      themeMode: ThemeMode.system,
      title: 'Fooderpals',
      // You assign MultiProvider as a property of Home. This accepts
      // a list of providers for Home’s descendant widgets to access.
      home: MultiProvider(
        providers: [
          // ChangeNotifierProvider creates an instance of TabManager,
          // which listens to tab index changes and notifies its listeners.
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
