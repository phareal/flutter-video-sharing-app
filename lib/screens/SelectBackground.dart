import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

import 'components/SelectMusicBackgroundMusicItem.dart';

class SelectBackgroundScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectBackgroundScreenState();
  }
}

class _SelectBackgroundScreenState extends State<SelectBackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Select a background music",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    border: new Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius:BorderRadius.all(Radius.circular(30))
                  ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:   TextField(
                        decoration: new InputDecoration(
                          hintText: 'Search a music',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white
                          ),
                          border: InputBorder.none,
                        ),
                      )),
                      IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){

                      })
                    ],
                  )
                )
                ),
              /*secondContainer*/
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Top music",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18
                    ),),
                    SizedBox(height:25),
                    MusicBackgroundItem(),
                    SizedBox(height:25),
                    MusicBackgroundItem(),
                    SizedBox(height:25),
                    MusicBackgroundItem()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Remix Songs",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18
                    ),),
                    SizedBox(height:25),
                    MusicBackgroundItem(),
                    SizedBox(height:25),
                    MusicBackgroundItem(),
                    SizedBox(height:25),
                    MusicBackgroundItem()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: primaryBottomBg,
        backgroundColor: Colors.black,
        items: <Widget>[
          GestureDetector(
            child: Container(
              child: Icon(FontAwesome.music,color: primaryPurpleColor,),
            ),
            onTap: (){

            },
          ),

          Container(

            child: IconButton(icon: Icon(FontAwesome.video_camera,color: Colors.white), onPressed: null),
          ),
          GestureDetector(
             onTap: (){
               print("object");
             },
            child: Icon(
              AntDesign.API,
              color: Colors.white,
            ),

          ),

        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
