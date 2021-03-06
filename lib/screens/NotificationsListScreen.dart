

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/components/NotificationListItem.dart';

class NotificationsListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NotificationListScreenState();
  }

}

class _NotificationListScreenState extends State<NotificationsListScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Notifications",style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16
        ),),
        leading: IconButton(
          icon: Icon(AntDesign.arrowleft,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(MaterialIcons.search,color: Colors.black,), onPressed: null)
        ],
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context,index){
              return new NotificationsListItem(index:index);
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.transparent,
            ),
            itemCount: 6),
      ),
    );
  }

}