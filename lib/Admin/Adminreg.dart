
import 'package:flutter/material.dart';
//import 'package:percent_indicator/linear_percent_indicator.dart';

class AdminReg extends StatefulWidget {
  const AdminReg({Key? key}) : super(key: key);

  @override
  State<AdminReg> createState() => _AdminRegState();
}

class _AdminRegState extends State<AdminReg> {
  final _formKey=GlobalKey<FormState>();
  List choice=["home","Apartment"];
  int choiceindex=0;
 var _isSelected=false;
  @override
  Widget build(BuildContext context) {
    final ptype=Container(
      child: ListView.builder(itemCount:choice.length,
          itemBuilder:(BuildContext context,int index){
        return ChoiceChip(label:choice[index] , selected: choiceindex==index,
          selectedColor:Colors.indigoAccent,
          onSelected:(value){
            setState(() {
              choiceindex = value ? index :0;
            });
          },)    ;
          } ),
    );
   /* final propertytype =ChoiceChip(label: Text(chipname),
   labelStyle:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold),
     selected:_isSelected,
     shape:RoundedRectangleBorder(
       borderRadius:BorderRadius.circular(30.0),
     ),
     backgroundColor:Colors.white,
     onSelected:(isSelected){
     setState(() {
       isSelected=_isSelected;
     });
     },
     selectedColor:Colors.indigoAccent,
   );
   */
   /*** final indecator=LinearPercentIndicator(
     width:170,
     percent:16/100,
     animation:true ,
     animationDuration:77,
     leading:new Text("7"),
     progressColor:Colors.orange,

   );***/
    return Scaffold(
      appBar: AppBar(
        title:Text(""),
      ),
      backgroundColor:Colors.white ,

      body:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children:[
          Wrap(
            children:[
              SizedBox(height:30,width: 20,),
              Text("Enter your House Type",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
              Container(
                height:200,
            child: ListView.builder(itemCount:choice.length,
                itemBuilder:(BuildContext context,int index){
                  return ChoiceChip(label:Text(choice[index]) , selected: choiceindex==index,
                    selectedColor:Colors.indigoAccent,
                    onSelected:(value){
                      setState(() {
                        choiceindex = value ? index :0;
                      });
                    },
                  backgroundColor:Colors.green,
                  )    ;
                } ),
        ),
    ],
          ),
    ],
      )
    );
  }
}
