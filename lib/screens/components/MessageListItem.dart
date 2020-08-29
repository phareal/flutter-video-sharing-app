
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class MessageListItem extends StatefulWidget{

  final int index;

  MessageListItem({this.index});

  @override
  State<StatefulWidget> createState() {
    return _MessageListItemState();
  }

}

class _MessageListItemState extends State<MessageListItem>{
  @override
  Widget build(BuildContext context) {
     return widget.index ==0? Container(
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 stops: [0,0.2,0.8,0]
             ),

         ),
       width: MediaQuery.of(context).size.width,
       child: Padding(padding: EdgeInsets.all(10),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
            Container(
              child:  Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:AssetImage("assets/img/profile.png"),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(width: 50,),
             Align(
               alignment: Alignment.center,
               child: Column(
                 children: <Widget>[
                   Text("Rikito",style: GoogleFonts.poppins(
                     fontSize: 15,
                     color: Colors.white60
                   ),),
                   Text("Yo dude how to you feel",style: GoogleFonts.poppins(
                       fontSize: 15,
                       color: Colors.white
                   )),
                 ],
               ),
             ),
             Expanded(
               child: Align(
                 child: Column(
                   children: <Widget>[
                       Container(
                         child: Text("9 hrs"),
                       ),
                     Container(
                       height: 20,
                       width: 20,

                       decoration: BoxDecoration(
                           color: primaryPurpleColor,
                         borderRadius: BorderRadius.all(Radius.circular(20))

                       ),
                         child: Text("5",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                           color: Colors.white
                         ),),
                       )
                   ],
                 ),
               )
             ),
       ],
     ),
       )
     ):Container(
         width: MediaQuery.of(context).size.width,
         child: Padding(padding: EdgeInsets.all(10),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Container(
                 child:  Stack(
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.all(0.0),
                       child: CircleAvatar(
                         radius: 25,
                         backgroundImage:AssetImage("assets/img/profile.png"),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(width: 50,),
               Align(
                 alignment: Alignment.center,
                 child: Column(
                   children: <Widget>[
                     Text("Rikito",style: GoogleFonts.poppins(
                         fontSize: 15,
                         color: Colors.grey
                     ),),
                     Text("Yo dude how to you feel"),
                   ],
                 ),
               ),
               Expanded(
                   child: Align(
                     child: Column(
                       children: <Widget>[
                         Container(
                           child: Text("9 hrs"),
                         ),
                         Container(
                           height: 20,
                           width: 20,

                           decoration: BoxDecoration(
                               color: primaryPurpleColor,
                               borderRadius: BorderRadius.all(Radius.circular(20))

                           ),
                           child: Text("5",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                               color: Colors.white
                           ),),
                         )
                       ],
                     ),
                   )
               ),
             ],
           ),
         )
     );
  }

}