import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Route/LoginScreen.dart';
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

  @override
  Widget build(BuildContext context) {
    final firstnamefield=TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value){
        firstNameEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
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
      onSaved: (value){
        LastNameEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter your lastname",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final emailfield=TextFormField(
      autofocus: false,
      controller: EmailEditingController,
      obscureText:true,
      //keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        EmailEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
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
      onSaved: (value){
        PasswordEditingController.text=value!;
      },
      textInputAction:TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10))
      ),
    );
    final confirmpasswordfield=TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value){
        confirmPasswordEditingController.text=value!;
      },
      textInputAction:TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
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

      child: MaterialButton(onPressed: (){},
        child: const Text("Signup",style:TextStyle(fontWeight:FontWeight.bold,),),),
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
                  children: <Widget>[
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
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text("Already have an account"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LoginScreen()));
                          },
                          child: Text("click here"),
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
}
