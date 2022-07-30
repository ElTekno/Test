import 'package:flutter/material.dart';

class Two extends StatelessWidget {
  const Two({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page Two"),),
      body: Center(
        child: Column(children: [
            Text("Page Two"),

            MaterialButton(onPressed: (){
              Navigator.of(context).pop();
            },child: Text("Back"),color: Colors.grey,),

            MaterialButton(onPressed: (){
              Navigator.of(context).pushNamed("Three");
            },child: Text("Go To Page Three"),color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}