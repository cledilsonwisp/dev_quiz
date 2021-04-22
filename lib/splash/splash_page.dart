import 'dart:async';
import 'package:devquiz/animations/itemfader.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/homePage/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Center( 
          child: ItemFader(index:1, animationDuration:250, child:Image.asset(AppImages.logo)),
        ),
      ),
    );
  }
}