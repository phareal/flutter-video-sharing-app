import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/misc/ProfileDrawer.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  var  _profilePageScaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _profilePageScaffoldKey,
        endDrawer: new ProfileDrawer(),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: primaryBgColor,
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(280.0),
              child: Container(
                  height: 280,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child:Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage:AssetImage("assets/img/profile.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: <Widget>[
                                Text("@kripesh.mishra97",style: GoogleFonts.poppins(
                                    fontSize: 20
                                ),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text("100",style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              SizedBox(height: 1),
                                              Text("Following"),

                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text("100",style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              SizedBox(height: 1),
                                              Text("Following"),

                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text("100",style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              SizedBox(height: 1),
                                              Text("Following"),

                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),


                              ],
                            )
                          ],
                        ),
                      ),
                      friendsStatus,
                      SizedBox(height: 20,),
                      TabBar(
                          labelColor: Colors.grey,
                          indicatorColor: Colors.grey,
                          tabs: [
                            Tab(
                                child:Icon(FontAwesome.video_camera,color: Colors.grey,)
                            ),
                            Tab(
                                child:Icon(FontAwesome.photo,color: Colors.grey)
                            ),

                          ])
                    ],
                  ))),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesome.bell,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.dashboard, color: Colors.black),
              onPressed: () {
                print("object");
                _profilePageScaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        body: TabBarView(
            children:[
              Container(
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[

                    for(var i = 0 ;i<10;i++)
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/img/profile.png")
                            )
                        ),
                      )

                  ],
                ),
              ),
              Container(
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    for(var i = 0 ;i<10;i++)
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/profile/pierre.jpg")
                            )
                        ),
                      )
                  ],
                ),
              ),
            ] ),
      ),
    );


  }

  Widget get friendsStatus => Container(
    height: 70,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context,index){
          return Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(9.0),
                child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/img/profile.png")
                ),
              ),
            ],
          );
        }
    ),
  );
}
