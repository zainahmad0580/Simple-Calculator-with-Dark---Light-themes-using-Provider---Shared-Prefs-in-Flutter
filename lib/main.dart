import 'package:calculator/provider/dark_theme_provider.dart';
import 'package:calculator/provider/input_provider.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/route/route_names.dart';
import 'package:calculator/route/routes.dart';
import 'package:calculator/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(create: (_) => InputProvider())
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Simple Calculator',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: RouteNames.home,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
