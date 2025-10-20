import 'package:flutter/material.dart';
import 'package:flutter_application_new1/medule/pages/Home_Screen.dart';
import 'package:flutter_application_new1/widgets/animation_line.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => HomeScreen()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset("assets/logo/logo.svg", width: 188)),
          Gap(10),
          AnimationLine(),
        ],
      ),
    );
  }
}
