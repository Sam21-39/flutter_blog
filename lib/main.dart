import 'package:flutter/material.dart';
import 'package:flutter_blog/Views/IntroScreens/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0.0),
        primarySwatch: Colors.teal,
        backgroundColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0.0),
        primarySwatch: Colors.teal,
        backgroundColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      home: const Splash(),
    );
  }
}
