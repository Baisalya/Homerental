import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final Fullnamefield=Align(
      alignment: AlignmentDirectional(-1, -0.7),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
        child: TextFormField(
        //  controller: textController1,
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelText: 'FullName',
            hintText: 'Your Name',
            // hintStyle: FlutterFlowTheme.of(context).bodyText2,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3E3C3C),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3E3C3C),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
          ),
          //  style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );

    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.transparent,
      ),
      body:SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:Stack(
            children: <Widget>[
              const Align(
                alignment: AlignmentDirectional(-0.95, -0.95),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.9, -0.8),
                child: Text(
                  'Personal Details',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height:50,),
              Fullnamefield,

            ],
          ),
        ),

      ),

    );
  }
}
