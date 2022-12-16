

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:homerental/widgets/drawer.dart';
import 'package:homerental/widgets/myPage.dart';

import '../Pages/HomePage.dart';
import 'SearchPage.dart';

class NavbarItemPage extends StatefulWidget {
  const NavbarItemPage({Key? key}) : super(key: key);

  @override
  State<NavbarItemPage> createState() => _NavbarItemPageState();
}

class _NavbarItemPageState extends State<NavbarItemPage> {
  List pages=[
    HomePage(),
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
