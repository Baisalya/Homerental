//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import 'LoginScreen.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey=GlobalKey<FormState>();//form key
  //Text editing controllers
  final firstNameEditingController=new TextEditingController();
  final LastNameEditingController=new TextEditingController();
  final EmailEditingController=new TextEditingController();
  final PasswordEditingController=new TextEditingController();
  final confirmPasswordEditingController=new TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final firstnamefield=TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regExp = new RegExp(r'^.{3,}$');
        if(value !.isEmpty){
          return "firstname can't be empty";
        }if(! regExp.hasMatch(value)){
          return "Enter a valid name min charcter 3";
        }
        return null;
      },
      onSaved: (value){
        firstNameEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your firstname",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final lastnamefield=TextFormField(
      autofocus: false,
      controller: LastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){

        if(value !.isEmpty){
          return "secondname can't be empty";
        }
        return null;
      },
      onSaved: (value){
        LastNameEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your lastname",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final emailfield=TextFormField(
      autofocus: false,
      controller: EmailEditingController,

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
        EmailEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your Email",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final passwordfield=TextFormField(
      autofocus: false,
      obscureText:true,
      controller: PasswordEditingController,
     // keyboardType: TextInputType.visiblePassword,
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
        PasswordEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final confirmpasswordfield=TextFormField(
      autofocus: false,
      obscureText:true,
      controller: confirmPasswordEditingController,
      //keyboardType: TextInputType.visiblePassword,
      validator:(value){
        if(confirmPasswordEditingController.text != PasswordEditingController.text){
          return "Password not matching";
        }
        return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text=value!;
      },
      textInputAction:TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "ConfirmPassword",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final Signup=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(36),
      color: Colors.deepOrange,

      child: MaterialButton(onPressed: (){
           signUp(EmailEditingController.text, PasswordEditingController.text);
      },
        child: const Text("Signup",style:TextStyle(fontWeight:FontWeight.bold,),),),
    );

    return Scaffold(
        body:AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light ,
        child:GestureDetector(
        child: Stack(
        children: <Widget>[
        Container(
        height:double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
        gradient:LinearGradient(
        colors: [
        Colors.orange,
        Colors.deepOrangeAccent,
      //  Colors.blueGrey,
        Colors.orangeAccent,
        Colors.deepOrange],
        begin:Alignment.bottomCenter,
        end:Alignment.topRight
    ),

    ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
             // color: Colors.white38,
              child: Form(
                key:_formKey ,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100,child: Image(image: AssetImage('Assets/home.jpg'),),),
                    SizedBox(height: 8,width: 7,),
                    firstnamefield,
                    SizedBox(height: 8,width: 6,),
                    lastnamefield,
                    SizedBox(height: 8,width: 6,),
                    emailfield,
                    SizedBox(height: 8,width: 6,),
                    passwordfield,
                    SizedBox(height: 8,width: 6,),
                    confirmpasswordfield,
                    SizedBox(height: 8,width: 6,),
                    Signup,
                    SizedBox(height: 20,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text("Already have an account"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LoginScreen()));
                          },

                          child: Text(" click here",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),),
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
          ),
          ]
          )
        )

        )
    );
  }
  void signUp(String email, String password ) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email:email,password:password).
      then((value) => {
        postDetailesToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  postDetailesToFirestore()async{
    /***************************
     calling from firestore
        calling from user model
        sending these values
     **************************/
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User ? user =_auth.currentUser;
    UserModel userModel =UserModel();
    //writing the values
    userModel.uid= user!.uid;
    userModel.email=user.email;
    userModel.firstname=firstNameEditingController.text;
    userModel.lastname=LastNameEditingController.text;


    await firebaseFirestore
    .collection("users") //
    .doc(user.uid)//
    .set(userModel.toMap());//creted for send the values
    Fluttertoast.showToast(msg: "User register Sucessfully:");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>HomePage()), (route) => false);
  }
}
