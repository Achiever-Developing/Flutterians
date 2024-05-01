import 'dart:async';

import 'package:exam_1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void changeScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed(
          MyRoutes.homePage,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      changeScreen(context);
    });

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/category/tranparent.jpeg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
