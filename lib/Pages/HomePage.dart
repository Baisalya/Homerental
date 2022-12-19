
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerental/widgets/drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController=TabController(length: 3,vsync:this );
    return Scaffold(
/*        appBar: AppBar(
          elevation:0,
          backgroundColor:Colors.white,
          title: const Center(
              child:Text("")),

        ),

        drawer: MyDrawer()*/
    body:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 60,left: 10),
          child:Row(
            children: [
              Icon(Icons.menu_rounded,color:Colors.black,),
              Expanded(child: Container(),),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:Colors.grey.withOpacity(0.5)
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40,),
        /**Discover Text **/
        Container(
          margin: const EdgeInsets.only(left:20),
            child: Text("Discover",style: GoogleFonts.recursive(fontSize: 25,fontWeight:FontWeight.bold,letterSpacing:1),)
        ),
        const SizedBox(height: 25,),
        /**Tab bar **/
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 25,right: 25),
              labelColor:Colors.black,
              isScrollable:true,
              unselectedLabelColor:Colors.grey,
              controller: _tabController,
             indicatorSize: TabBarIndicatorSize.label,
              indicator:CircleTabIndicator(color: Colors.blueAccent, radius: 4),
              tabs: [
              Tab(text: "places",),
              Tab(text: "places",),
              Tab(text: "places",),
            ],),
          ),
        ),
        /**Tabbar View **/
        Container(
          height: 300,
          width: double.maxFinite,//available width given
          child: TabBarView(
            controller: _tabController,
            children: [
              Text("Aul"),
              Text("data"),
              Text("data"),
            ],
          ),
        )
      ],
    ),
    );

  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback ?onChanged]) {
    // TODO: implement createBoxPainter
    return _Circlepainter(color:color,radius:radius);
  }

}
class _Circlepainter extends BoxPainter{
  final Color color;
  double radius;
  _Circlepainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleoffset=Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-1);//its for middle
    canvas.drawCircle(offset+circleoffset, radius, _paint);
    // TODO: implement paint
  }

}