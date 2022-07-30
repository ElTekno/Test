import 'package:flutter/material.dart';

void main() {
  runApp(Alzekr());
}

class Alzekr extends StatefulWidget {
  const Alzekr({ Key? key }) : super(key: key);

  @override
  _AlzekrState createState() => _AlzekrState();
}

class _AlzekrState extends State<Alzekr> {  
  
  int _adad = 0;

  void _Click() {
    setState(() {
      _adad++;
    });
  }

  void _e3adh() {
    setState(() {
      _adad = 0;
    });
  }

  var zekr ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      
      title: 'عداد الإستغفار',
      home: Scaffold(
        body: Container(color: Colors.black ,child: Expanded(
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
              Container(child: Text("$_adad", style: TextStyle(color: Colors.white, fontSize: 50),),),
              Divider(height: 80,),
              DropdownButton(items: ["لاَ إِلَهَ إِلاَّ اللَّهَ","الْحَمْدُ للّهِ","سُبْحَانَ اللَّهِ"].map((e) => DropdownMenuItem(child: Text("$e",style: TextStyle(color: Colors.white),),value: e,)).toList(),
              onChanged: (val) {
                setState(() {
                  zekr = val;
                });
              },
              dropdownColor: Colors.black,
              style: TextStyle(color: Colors.white,fontSize: 35),
              hint: Text("لاَ إِلَهَ إِلاَّ اللَّهَ",style: TextStyle(color: Colors.white)),
              itemHeight: 80,
              underline: Divider(thickness: 0,),
              value: zekr,
              ),
                    
              SizedBox(height: 110,),
              InkWell(onTap: _e3adh ,child: Icon(Icons.replay_circle_filled,color: Colors.white,size: 75,),),
              Divider(height: 50,),
              InkWell(onTap: _Click, child: Icon(Icons.data_saver_on,color: Colors.white,size: 75,),),
            ],),),
          ),),
          
        

        
        
    ));
  }
}