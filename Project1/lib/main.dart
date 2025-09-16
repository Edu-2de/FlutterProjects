import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}