import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/components/RightSideBar.dart';

class CloseFriendsScreen extends StatefulWidget {

  final List<CameraDescription> cameraDescriptions;

  const CloseFriendsScreen({
    Key key,
    @required this.cameraDescriptions
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _CloseFriendsScreenState();
  }
}

class _CloseFriendsScreenState extends State<CloseFriendsScreen>  with SingleTickerProviderStateMixin {

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
              Container(
                  child:Row(
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.fromLTRB(15, 50, 0, 0),
                        child: Column(
                          children: <Widget>[
                           GestureDetector(
                             child: Text("Aa",style: GoogleFonts.poppins(
                               color: Colors.white,
                               fontSize: 40,
                               fontWeight: FontWeight.bold
                             )),
                           ),
                            SizedBox(height: 25),
                            IconButton(
                              icon: Icon(AntDesign.smile_circle,color: Colors.white,size: 35),
                              onPressed: (){
                                print("object");
                              },
                            ),
                            SizedBox(height: 25),
                            IconButton(
                              icon: Icon(MaterialCommunityIcons.volume_high,color: Colors.white,size: 35),
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



            ],
            /*main display*/

            /**/

          )),
      bottomNavigationBar: CurvedNavigationBar(
        color: primaryBottomBg,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.white,
        index: 1,
        items: <Widget>[
          GestureDetector(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  margin:EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage:AssetImage("assets/img/profile.png"),
                  ),
                ),
                SizedBox(height: 2,),
                Text("My Story",style: GoogleFonts.poppins(
                  color: Colors.white
                ),)
              ],
            )
          ),

          GestureDetector(
            onTap: (){
              print("object");
            },
            child: Container(
              margin:EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Icon(Icons.send,color: Colors.purple,)
            ),

          ),
          GestureDetector(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage:AssetImage("assets/img/profile.png"),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage:AssetImage("assets/img/profile.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text("Close friends",style: GoogleFonts.poppins(
                      color: Colors.white
                  ),)
                ],
              )
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
    super.initState();

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
          color: Colors.white,
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
