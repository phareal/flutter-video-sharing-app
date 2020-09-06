import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class CreateVideoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateVideoScreenState();
  }
}

class _CreateVideoScreenState extends State<CreateVideoScreen>  with SingleTickerProviderStateMixin {

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: null,
      body:  SafeArea(
          child: Column(
        /*top status */
        children: <Widget>[
        /*  Container(
            margin: EdgeInsets.all(5),
            width: mediaquery.width,
            child:friendsStatus ,
          ),*/
          /*for the page content*/
          Expanded(
              child:Row(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(AntDesign.setting,color: Colors.white,size: 35),
                          onPressed: (){
                            print("object");
                          },
                        ),
                        SizedBox(height: 25),
                        IconButton(
                          icon: Icon(AntDesign.camera,color: Colors.white,size: 35),
                          onPressed: (){
                            print("object");
                          },
                        ),
                        SizedBox(height: 25),
                        IconButton(
                          icon: Icon(Icons.flash_on,color: Colors.white,size: 35),
                          onPressed: (){
                            print("object");
                          },
                        ),
                        SizedBox(height: 25),
                        IconButton(
                          icon: Icon(Icons.close,color: Colors.white,size: 35),
                          onPressed: (){
                            print("object");
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container(

                    child: SingleChildScrollView(
                        child: Text("",style: TextStyle(color: Colors.white)),
                    ),

                  ),

                  ),

                ],

              )

          ),
          bottomSectionPickup,

        ],
        /*main display*/

        /**/

      )),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.black,
        index: 1,

        items: [
          Padding(
            padding: EdgeInsets.all(0),
            child: InkWell(
              onTap: (){
                print("up");
              },
              child: Icon(
                FontAwesome.music,
                color: Colors.white,
              ),

            )
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: IconButton(
              icon: Icon(
                AntDesign.videocamera,
                color: Colors.white,
              ),
              onPressed: (){
                print("object");
              },
            )
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: GestureDetector(
              child: Icon(
                AntDesign.API,
                color: Colors.white,
              ),
              onTap: (){
                Navigator.pushNamed(context, 'ForFilters');
              },
            )
          ),
        ],

        color: primaryBottomBg,
      ),

    );
  }

  Function animate(){
    if(!isOpened){
      _animationController.forward();
    }else{
      _animationController.reverse();
      this.isOpened = !this.isOpened;
    }
  }


  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {

        });
      });
    _animationIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue,end:Colors.red).animate(CurvedAnimation(parent: _animationController,
        curve: Interval(0.00, 1)
    ));

    _translateButton =  Tween<double>(begin: _fabHeight, end: -14)
        .animate(
        CurvedAnimation(parent: _animationController,
            curve: Interval(0.0, 0.75,curve: _curve)));

    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  Widget profileButton(){
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: (){

        },
        tooltip: 'Profile',
      ),
    );
  }
  Widget toggleButton(){
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: (){
          animate();
        },
        tooltip: 'Profile',
      ),
    );
  }

  Widget get bottomSectionPickup => Container(
    alignment: Alignment(0.0,1.0),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Slower",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize:16
            )),
            SizedBox(width: 20),
            Text("Slow",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize:16
            )),
            SizedBox(width: 20),
            Container(

              width: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0,0.2,0.8,0]
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Center(
                child: Text("Normal",style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize:16
                )),
              )
            ),
            SizedBox(width: 20),
            Text("Fast",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize:16
            )),
            SizedBox(width: 20),
            Text("Faster",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize:16
            )),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, 'DraftsVideosScreen');
              },
              child:  Text("Drafts",style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize:16
              )),
            ),

            SizedBox(width: 20),
            Text("Video",style: GoogleFonts.poppins(
                color: primaryPurpleColor,
                fontSize:16
            )),
            SizedBox(width: 20),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, 'Gallery');
              },
              child:Text("Gallery",style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize:16
              )),
            ),

            SizedBox(width: 20),
            Text("Photo",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize:16
            )),
          ],
        ),
      ],
    ),
  );
  
  
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
