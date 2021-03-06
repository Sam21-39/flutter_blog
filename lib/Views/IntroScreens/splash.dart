import 'package:flutter/material.dart';
import 'package:flutter_blog/Services/staicData.dart';
import 'package:flutter_blog/Views/Dashboard/home.dart';
import 'package:flutter_blog/Views/IntroScreens/intro.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var isDisplayOver = false.obs;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1200),
    ).then(
      (value) => isDisplayOver.value = true,
    );
    Future.delayed(
      const Duration(milliseconds: 2800),
    ).then(
      (value) async {
        final sp = await SharedPreferences.getInstance();
        if (sp.getBool(StaticData.isLogged) != null &&
            sp.getBool(StaticData.isLogged) == true) {
          Get.off(
            () => const Home(),
            popGesture: false,
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 800),
          );
        } else {
          Get.off(
            () => const Intro(),
            popGesture: false,
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 800),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Obx(
          () => FlutterLogo(
            style: isDisplayOver.value
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            size: size.width * 0.48,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 1200),
            textColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
