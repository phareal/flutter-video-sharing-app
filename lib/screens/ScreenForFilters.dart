import 'dart:io';

import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:photofilters/photofilters.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/PhotoViewScreen.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class ScreenForFilters extends StatefulWidget {

  final List<CameraDescription> cameraDescriptions;



  const ScreenForFilters({
    Key key,
    @required this.cameraDescriptions
  }):super(key:key);


  @override
  State<StatefulWidget> createState() {
    return _ScreenForFiltersState();
  }
}

class _ScreenForFiltersState extends State<ScreenForFilters>  with SingleTickerProviderStateMixin {

  List<Filter> filters = presetFiltersList;
  bool isOpened = false;
  CameraController _controller;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  bool pictureIsTaken = false;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: null,
      body: SafeArea(
          child:Stack(
            children: <Widget>[

              Container(

                  height: MediaQuery.of(context).size.height,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: new CameraPreview(_controller),
                  )

              ),

            ],
          )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        onTap: (index) {
          if (index == 1){
            this.takePicture(context);
          }
        },
        index: 1,
        backgroundColor: Colors.transparent,
        items: [
          Padding(
              padding: EdgeInsets.all(15),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'SelectBackground');
                },
                child: Icon(
                  FontAwesome.music,
                  color: Colors.white,
                ),

              )
          ),
          IconButton(icon: Icon(
            FontAwesome.video_camera,
            color: Colors.white,
          ), onPressed: (){
            print("object");
          }),
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
                          color: Colors.purple,
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
    super.initState();
    print("is taken ${pictureIsTaken.toString()}");
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
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void takePicture(BuildContext context) async{
    try {
      final path = join((await getTemporaryDirectory()).path,'${DateTime.now()}.png',);
       await _controller.takePicture(path);

       if (path != null){
         //call display feature
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PhotoViewScreen(imagePath: path,)));
       }
       print("path is $path");

    } catch (e) {

    print(e);

    }
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

  Widget get bottomSectionPickup => Align(
      alignment: Alignment.bottomCenter,
    child:  Container(
      alignment: Alignment(0.0,1.0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
      height: 150,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(

                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Center(
                    child: Text("Effects",style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize:16
                    )),
                  )
              ),
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
                    child: Text("Filter",style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize:16
                    )),
                  )
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 70,
            margin: EdgeInsets.all(5),
            child:filter ,
          ),
        ],
      ),
    ),
  );


  Widget get friendsStatus => Container(
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
  Widget get filter => Container(
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context,index){
          return Stack(
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
