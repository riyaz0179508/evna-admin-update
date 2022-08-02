import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(width*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height*0.20,
                ),
                Center(child: Image.asset("assets/Logo.jpg", height: height*0.10,)),
                SizedBox(
                  height: height*0.20,
                ),
                Container(
                  height: height*0.20,
                  width: width*0.80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFF2F2F2)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hey !", style: TextStyle(color: Colors.blue, fontSize: width*0.05, fontWeight: FontWeight.w600),),
                        SizedBox(
                          height: height*0.01,
                        ),
                        Text("Welcome to Evna Admin ", style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
