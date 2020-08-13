import 'package:flutter/material.dart';
import 'package:tiktok/helpers/colors.dart';
import 'dart:async';

import 'package:tiktok/screens/SignUp.dart';
void main() async {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ye Wala',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'splash': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'signUp' : (context) => SignUp(),
      },
      initialRoute: 'splash',

    );
  }
}

class SplashScreen extends StatefulWidget {



  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _SplashScreenState(){
    Future.delayed(Duration(seconds: 5), () {
      setState((){
        Navigator.pushNamed(context, 'signUp');
      });
    });
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(

        child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0,0.2,0.8,0]
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Image.asset(
                    "assets/img/logo.png",height: 23,width: 70,
                  ),
                  Image.asset(
                    "assets/img/title.png",height: 70,width: 70,
                  ),
                ],
              ),
          )
      ),
    );
  }


}
