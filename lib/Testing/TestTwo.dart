import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestTwo extends StatefulWidget {
  const TestTwo({ Key? key }) : super(key: key);

  @override
  _TestTwoState createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {

  var username;

  getPrefs() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("Name");
    });
    
    print("Success");
  }

  deletePrefs() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.Clear();
    prefs.remove("Name");
    print("Removing Successed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2"),),
      body: Center(
        child: Column(children: [
          Text("$username"),
          MaterialButton(onPressed: getPrefs,child: Text("Get Prefs"),),
          MaterialButton(onPressed: deletePrefs,child: Text("Remove Key"),)
        ],),
      ),
    );
  }
}