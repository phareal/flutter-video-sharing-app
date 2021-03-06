import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class ScreenForVideosFilters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenForVideosFiltersState();
  }
}

class _ScreenForVideosFiltersState extends State<ScreenForVideosFilters>  with SingleTickerProviderStateMixin {

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
        index: 1,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primaryBottomBg,
        items: [

          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[

                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'SelectBackground');
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesome.music,
                          color: Colors.white,
                        ),

                      ],
                    )
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
                AntDesign.videocamera,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[

                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'ForFilters');
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          AntDesign.API,
                          color: Colors.white,
                        ),

                      ],
                    )
                ),

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

  Widget get bottomSectionPickup => Container(
    alignment: Alignment(0.0,1.0),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
    width: MediaQuery.of(context).size.width,
    height: 150,
    child: Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0,0.2,0.8,0]
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                width: 100,

                child: Center(
                  child: Text("Effects",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize:16
                  )),
                )
            ),
            Container(

                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child: Center(
                  child: Text("Filter",style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize:16
                  )),
                )
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(5),
          child:filter ,
        ),
      ],
    ),
  );
  
  

  Widget get filter => Container(
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context,index){
          return Stack(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(9.0),
                child: Image(image: AssetImage("assets/img/profile.png")),
              ),
            ],
          );
        }
    ),
  );

}
