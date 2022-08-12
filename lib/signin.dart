import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homerental/Route/HomePage.dart';

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
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>HomePage()));
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
        Colors.deepPurpleAccent,
        Colors.indigoAccent,
      //  Colors.blueGrey,
        Colors.indigoAccent,
        Colors.teal],
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
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text("Already have an account"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LoginScreen()));
                          },

                          child: Text(" click here",style:TextStyle(color:Colors.orange,fontWeight:FontWeight.bold),),
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
}
