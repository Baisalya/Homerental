

import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/Navbar_item.dart';
import '../widgets/SearchPage.dart';
import '../widgets/drawer.dart';
import '../widgets/myPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages=[
    //HomePage(),
    Navbar_Items(),
    SearchPage(),
    MyPage()
  ];
  int navitem=0;
  void onTap(int index){
    setState(() {
      navitem=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: pages[navitem],
      bottomNavigationBar: BottomNavigationBar(
        onTap:onTap,
        currentIndex:navitem,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent.withOpacity(0.9),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels:false,
        showUnselectedLabels: false,
        elevation:0,
        items: [
          BottomNavigationBarItem(label:"home",icon:Icon(Icons.home_rounded),),
          //BottomNavigationBarItem(label:"Bar",icon:Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label:"Search",icon:Icon(Icons.search_sharp)),
          BottomNavigationBarItem(label:"Profile",icon:Icon(Icons.person_outlined)),
        ],),

    );
  }
}
