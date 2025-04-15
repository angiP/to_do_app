import 'package:flutter/material.dart';
import 'package:to_do_app/src/config/theme.dart';
import 'package:to_do_app/src/features/overview/presentation/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
