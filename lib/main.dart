import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/Views/IntroScreens/splash.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
