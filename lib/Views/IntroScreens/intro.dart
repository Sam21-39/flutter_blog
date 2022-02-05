import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/Views/LoginScreen/login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late Timer _timer;
  var currentIndex = 0.obs;
  var introDone = false.obs;

  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
    keepPage: true,
  );
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 3200), (Timer timer) {
      if (currentIndex.value < _assetList.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
        introDone.value = true;
      }

      controller.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

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
            SizedBox(
              width: size.width,
              height: size.height * 0.4,
              child: PageView.builder(
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                itemCount: _assetList.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.tealAccent,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          _assetList[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 3200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _introList[currentIndex.value],
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: introDone.value ? 1.0 : 0.0,
                child: MaterialButton(
                  minWidth: size.width * 0.8,
                  elevation: 8.0,
                  color: Colors.teal.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () => Get.off(
                    () => const Login(),
                    popGesture: false,
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 800),
                  ),
                  child: const Text(
                    'Let\'s Begin',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _assetList = const [
    'assets/secure_login.svg',
    'assets/blog_post.svg',
    'assets/weather.svg',
  ];

  final List<String> _introList = const [
    'Secure Login',
    'Write & Post Blogs',
    'Check City Weather'
  ];
}
