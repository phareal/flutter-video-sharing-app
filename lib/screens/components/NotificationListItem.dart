
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class NotificationsListItem extends StatefulWidget{

  final int index;

  NotificationsListItem({this.index});

  @override
  State<StatefulWidget> createState() {
    return _NotificationsListItemState();
  }

}

class _NotificationsListItemState extends State<NotificationsListItem>{
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
                    Text("Welcome to This Short Video App",style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white60
                    ),),
                    Text("9hrs",style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white
                    )),
                  ],
                ),
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
                    Text("Welcome to This Short Video App",style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey
                    ),),
                    Text("9hrs"),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

}