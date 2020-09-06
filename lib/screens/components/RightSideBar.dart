
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class RightSideBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RightSideBarState();
  }

}


class _RightSideBarState extends State<RightSideBar> with SingleTickerProviderStateMixin{
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;


  @override
  void initState() {
    super.initState();
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


  @override
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


  Function animate(){
    if(!isOpened){
      _animationController.forward();
    }else{
      _animationController.reverse();
      this.isOpened = !this.isOpened;
    }
  }

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.fromLTRB(0,270,0,0),
      width: mediaQuery.width * 0.17,
      height: mediaQuery.height * 0.5,
      child: Center(
         child: Container(

             child: SpeedDial(
               onOpen: () => print('OPENING DIAL'),
               onClose: () => print('DIAL CLOSED'),
               backgroundColor: Colors.black,
               closeManually: true,
               animatedIcon: AnimatedIcons.menu_close,
               overlayColor: Colors.black,
               children: [
                 SpeedDialChild(
                      onTap: (){
                        print("dsd");
                        Navigator.pushNamed(context, 'profile');
                      },
                     backgroundColor: Colors.black,
                     child: IconButton(icon: Icon(FontAwesome.user), onPressed: (){
                       Navigator.pushNamed(context, 'profile');
                     })
                 ),
                 SpeedDialChild(
                     backgroundColor: Colors.black,
                     child: IconButton(icon: Icon(FontAwesome.search), onPressed: (){
                       print("object");
                       Navigator.pushNamed(context, 'SearchVideoScreen');
                     })
                 ), SpeedDialChild(
                     onTap: () => print('FIRST CHILD'),
                     backgroundColor: Colors.purple,
                     child: IconButton(icon: Icon(FontAwesome.plus), onPressed: (){
        print("object");
        Navigator.pushNamed(context, 'ForVideoFilters');
      })
                 ), SpeedDialChild(
                     onTap: () => print('FIRST CHILD'),
                     backgroundColor: Colors.black,
                     child: IconButton(icon: Icon(FontAwesome.send), onPressed: (){
                       print("object");
                       Navigator.pushNamed(context, 'MessagesList');
                     })
                 ),SpeedDialChild(
                     onTap: () => print('FIRST CHILD'),
                     backgroundColor: Colors.black,
                     child: Icon(FontAwesome.home)
                 ),
               ],
             ),
           ),
         )

    );
  }
  


}