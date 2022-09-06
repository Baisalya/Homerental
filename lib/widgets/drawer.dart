
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homerental/Pages/HomePage.dart';
import 'package:homerental/model/user_model.dart';
import 'package:homerental/utility/route.dart';
import 'package:homerental/utility/route.dart';
import '../Admin/Adminreg.dart';
import '../Pages/LoginScreen.dart';
//import 'package:flight_ticket/login_page.dart';

class MyDrawer extends StatefulWidget {

  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //to show current user name details
  User? user=FirebaseAuth.instance.currentUser;
  UserModel userModel=UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      this.userModel=UserModel.fromMap(value.data());
    setState(() {});
    });
  }

  @override
  Widget drawertheme(){
   return Container(decoration: const BoxDecoration(
      gradient:LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Colors.indigoAccent,
            Colors.cyanAccent,
            Colors.cyan,
            Colors.teal],
          begin:Alignment.bottomCenter,
          end:Alignment.topRight
      ),

    ),



   );
  }

Widget builddraw(){



  final image="Assets/image/drawer.jpg";
  return Column(
        children:<Widget>[ UserAccountsDrawerHeader(

        margin: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image:DecorationImage(image:const AssetImage("Assets/BG.jpg"),fit: BoxFit.cover),
          color:Colors.blue),
        accountName: Text("${userModel.firstname}",style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white),),
        accountEmail:Text("${userModel.email}",style:const TextStyle(fontSize:20,color:Colors.white),),
        currentAccountPicture:CircleAvatar(backgroundImage:AssetImage(image)),
        ),
    ],


    );//side of tringle
}

  @override
  Widget build(BuildContext context) {
    final  image="Assets/image/drawer.jpg";
    return Drawer(
      //child: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisSize.max,
              children: <Widget>[
                builddraw(),
                 ListTile(
                  leading: const Icon(CupertinoIcons.home,color:Colors.blue,),title: const Text("HoME"),
                 onTap: (){Navigator.pushNamed(context,Myroutes.homeRoute);},
                ),

                ListTile(
                    leading:const Icon(CupertinoIcons.profile_circled,color:Colors.blue),title:const Text("PrOFILE"),onTap: (){}),

                const ListTile(
                    leading:Icon(CupertinoIcons.bed_double_fill,color:Colors.blue),title:Text("Your Room"),
                  //  onTap: (){Navigator.pushNamed(context, Myroutes.ticketpage);}
                ),

                ListTile(
                    leading:const Icon(CupertinoIcons.circle_grid_hex,color:Colors.blue),title:const Text("SETTING"),onTap: (){}),
                ListTile(
                    leading:const Icon(Icons.help_outline,color:Colors.blue),title:const Text("Need Help"),onTap: (){}),
                const ListTile(
                  leading:Icon(Icons.money,color:Colors.blue),title:Text("Your Wallet"),
                  //  onTap: (){Navigator.pushNamed(context, Myroutes.paymentpage);}
                ),
                const Divider(),
                Column(
                  children: <Widget>[
                    const Text("Are You House owner",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                    ListTile(leading:const Icon(Icons.home_work_outlined),
                      title:const Text("Give your House Detail"),onTap: (){Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>AdminReg()));},
                    ),
                  ],
                ),

                Expanded(child: Align(alignment: Alignment.bottomLeft,
                  child: ListTile(
                      leading:const Icon(Icons.logout,color:Colors.blue),title:const Text("Logout"),onTap: (){logout(context);},

                  ),
                )),
              ],


                  ),
          ),
        ),

          );

  }
  Future <void>logout(BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LoginScreen()));
  }
}
