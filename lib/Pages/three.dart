import 'package:flutter/material.dart';

class Three extends StatelessWidget {
  const Three({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page Three"),),
      body: Center(
        child: Column(children: [
            Text("Page Three"),

            MaterialButton(onPressed: (){
              Navigator.of(context).pop();
            },child: Text("Back"),color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}