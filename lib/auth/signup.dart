import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var username , emailAddress , password ;
  late UserCredential userCredential;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  signUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()){
      formdata.save();
      try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      
      print(userCredential);
      return userCredential;

      } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(context: context,title: "Error",body: Text("Password is to weak"))..show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(context: context,title: "Error",dialogType: DialogType.ERROR,padding: EdgeInsets.all(10),body: Text("The account already exists for that email"))..show();
      }
    } catch (e) {
      print(e);
      }
    } else {print("Not Valid");}
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView(
        children: [

          Container(
            padding: EdgeInsets.only(bottom: 30,top: 35),
            child: Center(child: Image.asset("images/img1.png",width: 200,height: 200,))),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formState,
              child: Column(children: [
              
              TextFormField(
                onSaved: (val){
                  username = val;
                },

                validator: (val){
                  if (val!.length > 100) {
                    return "username can't to be larger than 100 letter";
                  }
                  if (val.length < 2) {
                    return "username can't to be less than 2 letter";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  )
                ),
              ),

              SizedBox(height: 20,),

              TextFormField(

                onSaved: (val){
                  emailAddress = val;
                },
                
                validator: (val){
                  if (val!.length > 100) {
                    return "email can't to be larger than 100 letter";
                  }
                  if (val.length < 2) {
                    return "email can't to be less than 2 letter";
                  }
                  return null;
                },
                
                decoration: InputDecoration(
                  hintText: "EmailAddress",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  )
                ),
              ),

              SizedBox(height: 20,),

              TextFormField(

                onSaved: (val){
                  password = val;
                },

                validator: (val){
                  if (val!.length > 100) {
                    return "Password can't to be larger than 100 letter";
                  }
                  if (val.length < 4) {
                    return "password can't to be less than 4 letter";
                  }
                  return null;
                },

                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  )
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(children: [
                Text("if you have account "),
                InkWell(
                  onTap: (){
                    bool canPop = Navigator.of(context).canPop();
                    print(canPop);
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                  child: Text("Click Here", style: TextStyle(color: Colors.blue),))
              ],),),

              SizedBox(height: 20,),

              Container(child: 
                MaterialButton(
                  onPressed: () async {
                    UserCredential? response = await signUp();
                    print("================================");
                    if (response != null){
                      Navigator.of(context).pushReplacementNamed("homepage");
                    } 
                    print("================================");
                  },
                  child: Text("Sign Up", style: Theme.of(context).textTheme.headline6),
                  color: Colors.black,
                  textColor: Colors.white,
                  
                ),
              )

            ],),),
          )
      ],)
      
    );
  }
}