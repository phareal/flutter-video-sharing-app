import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class StoryOneScreen extends StatefulWidget {
  final List<CameraDescription> cameraDescriptions;

  const StoryOneScreen({
    Key key,
    @required this.cameraDescriptions
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _StoryOneScreenState();
  }
}

class _StoryOneScreenState extends State<StoryOneScreen>  with SingleTickerProviderStateMixin {

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  CameraController _controller;




  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: null,
      body:  SafeArea(
          child: Stack(
            /*top status */
            children: <Widget>[
              Container(

                  height: MediaQuery.of(context).size.height,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: new CameraPreview(_controller),
                  )

              ),
              Padding(padding: EdgeInsets.all(20),child: IconButton(icon: Icon(MaterialIcons.settings_input_component,color: Colors.white,), onPressed: null),),

              Align(
                alignment: Alignment.topRight,
                child: Padding(padding: EdgeInsets.all(20),child: IconButton(icon: Icon(Icons.close,color: Colors.white,), onPressed: null),),

              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:bottomSectionPickup
              ),

            ],
          )),
      bottomNavigationBar: CurvedNavigationBar(
        color: primaryBottomBg,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.white,
        index: 1,
        items: <Widget>[
          GestureDetector(

            child: CircleAvatar(
              radius: 20,
              backgroundImage:AssetImage("assets/img/profile.png"),
            ),
          ),

          GestureDetector(
            onTap: (){
              print("object");
            },
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),

          ),
          GestureDetector(
            onTap: (){
              print("object");
            },
            child: Icon(
              MaterialCommunityIcons.camera,
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

    _controller = new CameraController(widget.cameraDescriptions[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
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
    width: MediaQuery.of(context).size.width,
    height: 150,
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          alignment: Alignment.bottomCenter,
          color: Colors.black.withOpacity(0.5),
          height: 30,
          width: MediaQuery.of(context).size.width,

          child:Navigation ,
        ),
      ],
    ),
  );



  Widget get Navigation =>  Container(
  

    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'BoomerangScreen');
          },
          child: Text("Custom Text",style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14
          ),),
        ),
        SizedBox(width: 20,),
        GestureDetector(
           onTap: (){
             Navigator.pushNamed(context, 'CloseFriendScreen');
           },
          child: Text("Boomerang",style: GoogleFonts.poppins(
            color: Colors.pink,
            fontSize: 14
          ),),
        ),
        SizedBox(width: 20,),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'CloseFriendScreen');
          },
          child: Text("Hands-free",style: GoogleFonts.poppins(
              color: Colors.white,
            fontSize: 14
          ),),
        )
      ],


    ),
  );



}
