import 'package:app/FireBaseCourse/FireBase.dart';
import 'package:app/Pages/one.dart';
import 'package:app/Pages/three.dart';
import 'package:app/Pages/two.dart';
import 'package:app/SplashScreen.dart';
import 'package:app/Testing/TestTwo.dart';
import 'package:app/Testing/Testing.dart';
import 'package:app/curd/addnotes.dart';
import 'package:app/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'alzekr_App/alzekr.dart';
import 'package:app/auth/login.dart';
import 'package:app/auth/signup.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

bool? isLogin ;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null){
    isLogin = false;
  } else {
    isLogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset("assets/man-working.json"),
        nextScreen: Testing(),
        // isLogin == false ? Login() : HomePage()
        duration: 3000,
        backgroundColor: Color.fromARGB(255, 41, 41, 41),
        splashIconSize: 300,
      ),
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: TextTheme(headline6: TextStyle(
          fontSize: 20,
          color: Colors.white
        ))
      ),
      routes: {
        "login" : (context) => Login(),
        "signup" : (context) => SignUp(),
        "homepage" : (context) => HomePage(),
        "addnotes" : (context) => AddNotes(),
        "testTwo" : (context) => TestTwo(),
      },
    );
  }
}