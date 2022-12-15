import 'package:flutter/material.dart';
import 'package:homerental/widgets/drawer.dart';


class Navbar_Items extends StatelessWidget {
  const Navbar_Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:0,
          backgroundColor:Colors.white,
          title: const Center(
              child:Text("")),

        ),

        drawer: MyDrawer()
    );

  }
}
