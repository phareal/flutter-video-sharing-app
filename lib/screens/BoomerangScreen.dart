import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class BoomerangScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _BoomerangScreenState();
  }

}

class _BoomerangScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0,0.1,1,0]
          ),

        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 33
                      )
                  ),
                )
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   IconButton(
                     icon: Icon(Icons.face,color: Colors.white),
                     color: Colors.white,
                     onPressed: (){

                     },
                   ),
                   IconButton(
                     icon: Icon(Icons.format_align_center,color: Colors.white),
                     color: Colors.white,
                     onPressed: (){

                     },
                   )
                ],
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: _BoomerangScreenNavbar(),// set it to f
    );
  }

}

class _BoomerangScreenNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
    height: 70,

     color: primaryBottomBg,
     padding: EdgeInsets.only(top: 5,bottom: 10),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         GestureDetector(
           child: CircleAvatar(
             radius: 20,
             backgroundImage:AssetImage("assets/img/profile.png"),
           ),
         ),
         GestureDetector(
           onTap: () {},
           child: ClipOval(
             child: Container(
               color: Colors.white,
               height: 40.0,
               width: 40.0,
               child: Icon(Icons.send,color: primaryPurpleColor,),
             ),
           ),
         ),
         GestureDetector(
           onTap: () {},
           child: ClipOval(
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                     colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                     stops: [0,0.1,1,0]
                 ),

               ),
               height: 40.0,
               width: 40.0,
             ),
           ),
         ),
       ],
     ),
   );
  }

}