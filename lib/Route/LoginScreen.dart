import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerental/signin.dart';

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
  @override
  Widget build(BuildContext context) {
    final emailField =TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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

    final passwordfiled=TextFormField(
      autofocus: false,
      controller: passwordController,
     //    keyboardType: TextInputType.visiblePassword,
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

      child: MaterialButton(onPressed: (){},
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
                 children: <Widget>[
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
                         child: Text("signup"),
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
