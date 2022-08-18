//import 'dart:html';
//import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerental/Pages/HomePage.dart';
import 'package:homerental/Pages/signin.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  //controlller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController=new TextEditingController();
  //firebase authentication
  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //EMAIL
    final emailField =TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Please enter your email");
        }
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return("Please enter a Valid Email-id");
        }
      },
      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_sharp),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter your Email",
        border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(10))
      ),
    );

    
    //password
    final passwordfiled=TextFormField(
      autofocus: false,
      controller: passwordController,
     //    keyboardType: TextInputType.visiblePassword,
      obscureText:true,
      validator:(value){
        /** r'^
            (?=.*[A-Z])       // should contain at least one upper case
            (?=.*[a-z])       // should contain at least one lower case
            (?=.*?[0-9])      // should contain at least one digit
            (?=.*?[!@#\$&*~]) // should contain at least one Special character
            .{8,}             // Must be at least 8 characters in length
            $ **/
        RegExp regExp=new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        if(value!.isEmpty){
          return ("password is required for login");
        }
        if(!regExp.hasMatch(value)){
          return ("please enter valid password(min. 8 character)");
        }
      },
      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Password",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final loginbutton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(36),
      color: Colors.deepOrange,

      child: MaterialButton(onPressed: (){
        login(emailController.text, passwordController.text);
      },
      child: const Text("Login",style:TextStyle(fontWeight:FontWeight.bold,),),),
    );
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Center(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(

               color: Colors.white,
               child: Form(
                 key:_formKey ,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment:CrossAxisAlignment.center,
                 children: <Widget>[
                 SizedBox(height: 200,child: Image(image: AssetImage('Assets/home.jpg'),),),
                   emailField,
                   SizedBox(height: 8,width: 6,),
                   passwordfiled,
                   SizedBox(height: 8,width: 6,),
                   loginbutton,
                   SizedBox(height: 10,width: 9,),
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget> [
                       Text("Don't have an account"),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context,
                               MaterialPageRoute(builder:(context)=>Signup()));
                         },
                         child: Text(" signup",style: TextStyle(color:Colors.orange,fontWeight: FontWeight.bold),),
                       )
                     ],
                   )
                 ],
               ),

               ),
             ),
           ),
         ),
      ),
    );
  }
  //login validate
void login(String email,String password)async{
    if(_formKey.currentState!.validate()){
      await auth.signInWithEmailAndPassword(email: email, password: password).
      then((uid) => {
        Fluttertoast.showToast(msg: "login Successfully"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())),
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
          });

    }
}
}
