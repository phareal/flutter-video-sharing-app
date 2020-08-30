

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tiktok/helpers/colors.dart';

class DraftsVideosItems extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DraftsVideosItemsState();
  }

}

class _DraftsVideosItemsState extends State<DraftsVideosItems>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Container(
      margin: EdgeInsets.all(5),
      height:150,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0,0.1,1,0]
        ),

      ),
      child:  Align(
        alignment: Alignment.topRight,
        child: Container(
          child: IconButton(
            icon: Icon(MaterialCommunityIcons.trash_can_outline,color: Colors.white,),
            onPressed: (){
              print("remove");
            },
          ),
        ),
      ),
    );
  }

}