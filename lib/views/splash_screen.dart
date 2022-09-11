import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

@override
  Timer initState() {
    super.initState();
    return Timer(const Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const HomeScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigo,
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * .60,
                    height: MediaQuery.of(context).size.width * .60,

                    child: Image.asset('assets/images/splashimage.png', scale: 2,)),
                const SizedBox(height: 20,),
                const Text('BMI & BFP Calculator', style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Janna',
                  shadows: [
                    BoxShadow(
                      offset: Offset(3,3),
                      blurRadius: 5,
                      spreadRadius: 20
                    ),
                  ],
                  fontWeight: FontWeight.w500
                ),),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
