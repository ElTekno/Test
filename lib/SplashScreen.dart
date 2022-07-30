import 'package:app/FireBaseCourse/FireBase.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
    void initState() {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FireBase()));
      }
      );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(alignment: Alignment.center,
        child: SizedBox(height: 1000, width: double.infinity,child: Lottie.asset("assets/splash.json"),),
      ),
    );
  }
}