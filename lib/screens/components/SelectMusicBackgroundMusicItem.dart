
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicBackgroundItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset("assets/mocks/music.png",height: 58,width: 76,),
          SizedBox(width: 10,),
          Column(
            children: <Widget>[
              Text("Jhon Abraham - Satyamev Jayte",style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15
              ),),
              SizedBox(height: 15,),
              Text("Jhon Abraham - Satyamev Jayte",style: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 15
              ),),
            ],
          )
        ],
      ),
    );
  }
  
}