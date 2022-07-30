import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List notes = [
    {
      "note" : "الدكتور محمود شعبان",
      "subtitle" : "أستاذ البلاغة"
    },
    {
      "note" : "الدكتور محمود شعبان",
      "subtitle" : "أستاذ البلاغة"
    },
    {
      "note" : "الدكتور محمود شعبان",
      "subtitle" : "أستاذ البلاغة"
    },
    {
      "note" : "الدكتور محمود شعبان",
      "subtitle" : "أستاذ البلاغة"
    },
    {
      "note" : "الدكتور محمود شعبان",
      "subtitle" : "أستاذ البلاغة"
    },
  ];

  getUser(){
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text("HomePage"),actions: [
          IconButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed("login");
          },icon: Icon(Icons.exit_to_app))
        ],),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).pushNamed("addnotes");
        },child: Icon(Icons.add,color: Colors.white,),backgroundColor: Theme.of(context).primaryColor,),
        body: Container(child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context , i){
            return Dismissible(key: Key("$i"), child: ListNotes(NotesK: notes[i],));
          }
          ),)
      ),
    );
  }
}

class ListNotes extends StatelessWidget{
  final NotesK;
  ListNotes({this.NotesK});
  @override
  Widget build(BuildContext context){
    return Card(
      child: Row(
        children: [

          Expanded(
            flex: 1,
            child: Image.asset("images/img5.png",fit: BoxFit.fill,)
          ),

          Expanded(
            flex: 3,
        child: ListTile(
          title: Text("${NotesK['note']}"),
          trailing: IconButton(onPressed:(){},icon: Icon(Icons.edit)),
          subtitle: Text("${NotesK['subtitle']}")
        ),
      ),

        ],
      ),
    );
  }
}