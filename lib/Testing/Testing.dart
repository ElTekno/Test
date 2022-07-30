import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:jiffy/jiffy.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class Testing extends StatefulWidget {
  const Testing({ Key? key }) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  List users = [];

  CollectionReference userRef = FirebaseFirestore.instance.collection("users");

  getData() async {
    var responseBody = await userRef.get();
    responseBody.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
    print(users);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context , i) {
          return ListTile(
            title: Text("username :${users[i]["username"]}"),
            subtitle: Text("Phone :${users[i]["phone"]}"),
          );
      })
    );
    }

}