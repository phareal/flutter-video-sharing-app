import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

import '../helpers/colors.dart';

class DashboardScreen extends StatefulWidget {
  final List<CameraDescription> cameraDescription;

  const DashboardScreen({Key key, @required this.cameraDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  CameraController _controller;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  Widget get topLeftSectionPickup => Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(AntDesign.setting, color: Colors.white, size: 35),
                  onPressed: () {
                    print("object");
                  },
                ),
                SizedBox(height: 25),
                IconButton(
                  icon: Icon(AntDesign.camera, color: Colors.white, size: 35),
                  onPressed: () {
                    print("object");
                  },
                ),
                SizedBox(height: 25),
                IconButton(
                  icon: Icon(Icons.flash_on, color: Colors.white, size: 35),
                  onPressed: () {
                    print("object");
                  },
                ),
                SizedBox(height: 25),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 35),
                  onPressed: () {
                    print("object");
                  },
                ),
              ],
            ),
          ),
        ],
      ));
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: null,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: new CameraPreview(_controller),
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: friendsStatus,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(MaterialCommunityIcons.home,
                          color: Colors.white, size: 45),
                      onPressed: () {
                        print("Home");
                      },
                    ),
                    SizedBox(height: 25),
                    IconButton(
                        icon: Icon(FontAwesome.send,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          print("Message");
                          Navigator.pushNamed(context, 'MessagesList');
                        }),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                primaryRedColor,
                                primaryPurpleColor,
                                primaryBlueColorDark,
                                primaryBlueColor
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.2, 0.8, 0]),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            print("Plus");
                            Navigator.pushNamed(context, 'createVideo');
                          }),
                    ),
                    SizedBox(height: 25),
                    IconButton(
                        icon: Icon(FontAwesome.search,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          print("Search");
                          Navigator.pushNamed(context, 'SearchVideoScreen');
                        }),
                    SizedBox(height: 25),
                    IconButton(
                        icon: Icon(FontAwesome.user,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          Navigator.pushNamed(context, 'profile');
                        })
                  ],
                ),
              ),
            ),
          ),
          /*  Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                child:  RightSideBar(),
              ),*/
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.black,
        index: 1,
        items: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'signUp');
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          AntDesign.heart,
                          color: Colors.white,
                        ),
                        Text(
                          "35",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'createVideo');
            },
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                FontAwesome.plus,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'signUp');
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          AntDesign.sharealt,
                          color: Colors.white,
                        ),
                        Text(
                          "Share",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
        color: primaryBottomBg,
      ),
    );
  }

  Function animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
      this.isOpened = !this.isOpened;
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.00, 1)));

    _translateButton = Tween<double>(begin: _fabHeight, end: -14).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: _curve)));

    _controller = new CameraController(
        widget.cameraDescription[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget profileButton() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {},
        tooltip: 'Profile',
      ),
    );
  }

  Widget toggleButton() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          animate();
        },
        tooltip: 'Profile',
      ),
    );
  }

  Widget get bottomSection => Container(
        alignment: Alignment(0.0, 1.0),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        width: MediaQuery.of(context).size.width,
        height: 20,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Friends", style: GoogleFonts.poppins(color: Colors.white)),
            SizedBox(width: 5),
            Container(
              height: 10,
              width: 1,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text("For You",
                style: GoogleFonts.poppins(color: primaryPurpleColor)),
          ],
        ),
      );

  Widget get friendsStatus => Container(
        height: 100,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {

              },
              child: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  primaryRedColor,
                                  primaryPurpleColor,
                                  primaryBlueColorDark,
                                  primaryBlueColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.2, 0.8, 0]),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              print("Plus");
                              Navigator.pushNamed(context, 'StoryOne');
                            }),
                      ),
                      Text(
                        "Your Story",
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: Colors.white),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'BoomerangScreen');
                          },
                          child: Padding(
                              padding: EdgeInsets.all(9.0),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/img/profile.png")),
                                  Text(
                                    "John doe",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10, color: Colors.white),
                                  )
                                ],
                              )),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
}
