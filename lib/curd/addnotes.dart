import 'package:flutter/material.dart';


class AddNotes extends StatefulWidget {
  const AddNotes({ Key? key }) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Notes"),),
      body: Column(children: [
          TextFormField(
            maxLength: 30,
            decoration: InputDecoration(
            filled: true,
            labelText: "Title Note",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.note),
          ),),

          TextFormField(
            maxLength: 300,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
            filled: true,
            labelText: "Description",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.note),
          ),),

          MaterialButton(onPressed: (){
            showBottomSheet();
          },child: Container(color: Colors.blue, padding: EdgeInsets.all(10),child: Text("Add Image For Note",style: TextStyle(fontSize: 20,))),),

          MaterialButton(onPressed: (){},child: Container(color: Colors.blue, padding: EdgeInsets.symmetric(horizontal: 100,vertical: 7),margin: EdgeInsets.only(top: 10),child: Text("Add Note",style: TextStyle(fontSize: 25,))),),

      ]
      )
    );
  }

  showBottomSheet() {

      return showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.all(10),
          height: 200,
          child: 
          Column(children: [
            Text("Please Choose Image",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            SizedBox(height: 25,),

            //InkWell
            InkWell(onTap: (){},child: Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.photo),
                  VerticalDivider(width: 10,),
                  Text("From Gallery",style: TextStyle(fontSize: 17),),
                ],
              )),),

            //SizedBox
            SizedBox(height: 10,),
            
            //InkWell 2
            InkWell(onTap: (){},child: Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.camera),
                  VerticalDivider(width: 10,),
                  Text("From Camera",style: TextStyle(fontSize: 17),),
                ],
              )),),

          ],)
          
          
        );}
    );
  }

}