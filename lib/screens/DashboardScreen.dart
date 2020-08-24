import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen>  with SingleTickerProviderStateMixin {

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
          Container(
            margin: EdgeInsets.all(5),
            width: mediaquery.width,
            child:friendsStatus ,
          ),
          /*for the page content*/
          Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(child: Container(

                    child: SingleChildScrollView(
                        child: Text("",style: TextStyle(color: Colors.white),),
                    ),

                  ),

                  ),
                  RightSideBar()
                ],

              )

          ),
          bottomSection,

        ],
        /*main display*/

        /**/

      )),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        index: 1,

        items: [
          Padding(
            padding: EdgeInsets.all(15),
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
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'createVideo');
            },
            child:Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                FontAwesome.plus,
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                IconButton(icon: Icon(
                AntDesign.sharealt,
    color: Colors.white,
    ) ,onPressed: (){
                  Navigator.pushNamed(context, 'profile');
                },),

                Text(
                  "Share",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                )
              ],
            ),
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

  Widget get bottomSection => Container(
    alignment: Alignment(0.0,1.0),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
    width: MediaQuery.of(context).size.width,
    height: 20,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Friends",style: GoogleFonts.poppins(
          color: Colors.white
        )),
        SizedBox(width: 5),
        Container(
          height: 10,
          width: 1,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text("For You",style: GoogleFonts.poppins(
          color: primaryPurpleColor
        )),
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
