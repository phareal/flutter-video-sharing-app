
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class EditUserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return new _EditUserProfileState();
  }

}


class _EditUserProfileState extends State<EditUserProfile>{

  int _selected = 0;

  void onRadioChanged(int value) {
    setState((){
      _selected = value;
    });

    print('Value = $value');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: new AppBar(
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.white,
       title: Text("Edit profile",style: GoogleFonts.poppins(
         color: Colors.black,
         fontSize: 16
       ),),
       leading: IconButton(
         icon: Icon(MaterialCommunityIcons.arrow_left,color: Colors.black,),
         onPressed: (){
           Navigator.of(context).pop();
         },
       ),
     ),
     backgroundColor: Color(0xffF1F1F1),
     body: Container(
       width: MediaQuery.of(context).size.width,
       child: Column(
         mainAxisSize: MainAxisSize.max,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child:  Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:AssetImage("assets/img/profile.png"),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 20),
           /*logo*/
           Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
               height: 50,
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 2), // changes position of shadow
                     ),
                   ],
                   borderRadius: BorderRadius.all(Radius.circular(25))
               ),
               width: MediaQuery.of(context).size.width,
               child: Container(
                 width: 240,
                 child: Center(
                     child: TextField(
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         hintText: 'Kripesh Narayan Mishra',
                         border: InputBorder.none,

                       ),
                     )
                 ),
               )

           ),
           SizedBox(height: 10),
           Container(
               margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
               height: 50,
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 2), // changes position of shadow
                     ),
                   ],
                   borderRadius: BorderRadius.all(Radius.circular(25))
               ),
               width: MediaQuery.of(context).size.width,
               child: Container(
                 width: 240,
                 child: Center(
                     child: TextField(
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         hintText: 'kripesh.mishra97',
                         border: InputBorder.none,

                       ),
                     )
                 ),
               )

           ),
           SizedBox(height: 10),
           new Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new Radio(
                 value: 0,
                 activeColor: primaryPurpleColor,
                 groupValue: _selected,
                 onChanged: onRadioChanged,
               ),
               new Text(
                 'Male',
                 style: new TextStyle(fontSize: 16.0),
               ),
               new Radio(
                 value: 1,
                 groupValue: _selected,
                 onChanged: onRadioChanged,
               ),
               new Text(
                 'Female',
                 style: new TextStyle(
                   fontSize: 16.0,
                 ),
               ),
             ],
           ),
           SizedBox(height: 10),
           Container(
               margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
               height: 50,
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 2), // changes position of shadow
                     ),
                   ],
                   borderRadius: BorderRadius.all(Radius.circular(25))
               ),
               width: MediaQuery.of(context).size.width,
               child: Container(
                 width: 240,
                 child: Center(
                     child: TextField(
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         hintText: '+91 9794041054',
                         border: InputBorder.none,

                       ),
                     )
                 ),
               )

           ),
           SizedBox(height: 10),
           Container(
               margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
               height: 50,
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 2), // changes position of shadow
                     ),
                   ],
                   borderRadius: BorderRadius.all(Radius.circular(25))
               ),
               width: MediaQuery.of(context).size.width,
               child: Container(
                 width: 240,
                 height: 161,
                 child: Center(
                     child: TextField(
                       maxLines: null,
                       keyboardType: TextInputType.multiline,
                       textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         hintText: 'About yourselfs',
                         border: InputBorder.none,

                       ),
                     )
                 ),
               )

           ),
           SizedBox(height: 10),
           Expanded(

             child: Align(
               child: Container(
                 height: 50.0,
                 child: RaisedButton(
                   onPressed: () {
                     print("object");

                     Navigator.pushNamed(context, 'NotificationList');
                   },
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                   padding: EdgeInsets.all(0.0),
                   child: Ink(

                     decoration: BoxDecoration(
                         gradient: LinearGradient(
                             colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                             begin: Alignment.topLeft,
                             end: Alignment.bottomRight,
                             stops: [0,0.2,0.8,0]
                         ),
                         borderRadius: BorderRadius.circular(30.0)
                     ),
                     child: Container(
                       constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                       alignment: Alignment.center,
                       child: Text(
                           "Update",
                           textAlign: TextAlign.center,
                           style:GoogleFonts.poppins(
                               color: Colors.white,
                               fontSize: 18
                           )
                       ),
                     ),
                   ),
                 ),
               ),
             )
           )

         ],
       ),
     )

   );
  }

}