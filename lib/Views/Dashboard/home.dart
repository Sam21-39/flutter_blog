import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blog/Model/weather.dart';
import 'package:flutter_blog/Services/authHandler.dart';
import 'package:flutter_blog/Services/staicData.dart';
import 'package:flutter_blog/Views/LoginScreen/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
            ElevatedButton.icon(
              onPressed: () async {
                final url = Uri.parse(
                  "https://fcc-weather-api.glitch.me/api/current?lat=22.5726&lon=88.3639",
                  // 'http://www.7timer.info/bin/api.pl?lon=113.17&lat=23.09&product=astro&output=json',
                );
                final response = await http.get(url);
                // print(
                // json.decode(response.body),
                // );
                final weather = WeatherModel.fromJson(
                  json.decode(response.body),
                );
                print(weather.main?.temp);
              },
              icon: const Icon(Icons.link),
              label: const Text('weather'),
            )
          ],
        ),
      ),
    );
  }
}
