import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  var emailAddress , password ;
  late UserCredential userCredential ;

  signIn() async {
    var formdata = formState.currentState;
    if (formdata!.validate()){
      formdata.save();
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
        );
        print(userCredential.user!.email);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(context: context,title: "Error",body: Text("No user found for that email"))..show();
        } else if (e.code == 'wrong-password') {
            AwesomeDialog(context: context,title: "Error",body: Text("Wrong password provided for that user"))..show();
          }
      }
    } else {print("Not Valid");}
  }
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        children: [

          Container(
            padding: EdgeInsets.only(bottom: 10,top: 70),
            child: Center(child: Image.asset("images/img1.png",width: 200,height: 200,))),

          Container(
            padding: EdgeInsets.all(25),
            child: Form(
              key: formState,
              child: Column(children: [
              TextFormField(

                onSaved: (val){
                emailAddress = val;
                },

                validator: (val){
                  if (val!.length > 100) {
                    return "EmailAddress can't to be larger than 100 letter";
                  }
                  if (val.length < 2) {
                    return "EmailAddress can't to be less than 2 letter";
                  }
                  return null;
                },

                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,

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
                    return "Password can't to be less than 4 letter";
                  }
                  return null;
                },

                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  )
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(children: [
                Text("if you havn't account "),
                InkWell(
                  onTap: (){
                    bool canPop = Navigator.of(context).canPop();
                    print(canPop);
                    Navigator.of(context).pushReplacementNamed("signup");
                  },
                  child: Text("Click Here", style: TextStyle(color: Colors.blue),))
              ],),),

              SizedBox(height: 20,),

              Container(child: 
                MaterialButton(
                onPressed: () async {
                  UserCredential? user = await signIn();
                  print("================================");
                  if (user != null){
                    Navigator?.of(context).pushReplacementNamed("homepage");
                  } else {print("Sign Up Faild");}
                  print("================================");
                },
                  
                child: Text("Sign In", style: Theme.of(context).textTheme.headline6),
                color: Colors.black,
                textColor: Colors.white,
                
                ),
              )

            ],),),
          ),
        ],
      )
      
    );
  }
}