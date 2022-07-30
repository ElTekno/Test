import 'package:flutter/material.dart';

class One extends StatelessWidget {
  const One({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page One"),),
      body: Center(
        child: Column(children: [
            Text("Page One"),

            MaterialButton(onPressed: (){
              if (Navigator.of(context).canPop()){
                Navigator.of(context).pop();
              }else
              Navigator.of(context).pushNamed("home");
            },child: Text("Back"),color: Colors.grey,),

            MaterialButton(onPressed: (){
              Navigator.of(context).pushNamed("Two");
            },child: Text("Go To Page Two"),color: Colors.grey,),

            MaterialButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed("home");
            },child: Text("Go To Page home"),color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}