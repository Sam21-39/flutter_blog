import 'package:flutter/material.dart';
import 'package:flutter_blog/Services/authHandler.dart';
import 'package:flutter_blog/Services/dataHandler.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final AuthHandler auth = AuthHandler.instance;
  final DataHandler data = DataHandler.dataInstance;

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                FlutterLogo(
                  size: size.width * 0.48,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 1200),
                  textColor: Colors.teal,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Flutter Blog',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              minWidth: size.width * 0.8,
              elevation: 8.0,
              color: Colors.teal.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.all(16.0),
              onPressed: () async {
                
                

                // Get.off(
                //   () => const Login(),
                //   popGesture: false,
                //   transition: Transition.fadeIn,
                //   duration: const Duration(milliseconds: 800),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                    child: Image.asset(
                      'assets/google-logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign In with Google',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
