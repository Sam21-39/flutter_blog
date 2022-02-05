import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/Services/authHandler.dart';
import 'package:flutter_blog/Services/staicData.dart';
import 'package:flutter_blog/Views/LoginScreen/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.04,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final auth = AuthHandler.instance;
                final sp = await SharedPreferences.getInstance();
                auth.signOut();
                sp.setBool(StaticData.isLogged, false);
                Get.off(
                  () => Login(),
                  popGesture: false,
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 800),
                );
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
