import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_self_quiz_app/utils/animation_contsance.dart';
import 'package:my_self_quiz_app/utils/color_constance.dart';
import 'package:my_self_quiz_app/view/category_screen/category_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstance.mainblack,
      body: Center(
        child: Lottie.asset(AnimationContsance.LOTTIEIMAGE),
      ),
    );
  }
}
