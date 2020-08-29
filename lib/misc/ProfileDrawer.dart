import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProfileDrawerState();
  }
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new DrawerHeader(child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(9.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:AssetImage("assets/img/profile.png"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Text("@kripesh.mishra97",style: GoogleFonts.poppins(
                          fontSize: 15
                      )),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context,"EditUserProfile");
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          child: Align(
                            child: Text("Edit profile",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                fontSize: 14,
                              color: Colors.white
                            )),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0,0.2,0.8,0]
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ]
                  )
                ],
              )
              ),
              Expanded(child:  ListView(
                children: <Widget>[
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(MaterialIcons.home, color: primaryPurpleColor),
                        SizedBox(
                          width: 20,
                        ),
                        new Text("Home")
                      ],
                    ),
                  ),
                  Divider(),
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(MaterialIcons.notifications, color: primaryPurpleColor),
                        SizedBox(
                          width: 20,
                        ),
                        new Text("Notifications Settings")
                      ],
                    ),
                  ),
                  Divider(),
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(MaterialCommunityIcons.file, color: primaryPurpleColor),
                        SizedBox(
                          width: 20,
                        ),
                        new Text("Privacy & Policy")
                      ],
                    ),
                  ), // h
                  Divider(),
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(MaterialCommunityIcons.link, color: primaryPurpleColor),
                        SizedBox(
                          width: 20,
                        ),
                        new Text("Link account")
                      ],
                    ),
                  ), //
                  Divider(),
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(MaterialCommunityIcons.share_variant,
                            color: primaryPurpleColor),
                        SizedBox(
                          width: 20,
                        ),
                        new Text("Share Profile")
                      ],
                    ),
                  )
                ],
              )),
              Expanded(
                child: Align(

                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: new ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(MaterialCommunityIcons.logout_variant, color: primaryPurpleColor),
                          SizedBox(
                            width: 20,
                          ),
                          new Text("Logout")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             
            ]));
  }
}
