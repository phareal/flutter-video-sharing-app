import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/components/DraftsVideoItems.dart';

class DraftsVideosScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _DraftsVideoScreenState();
  }

}

class _DraftsVideoScreenState extends State<DraftsVideosScreen>{
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         elevation: 0.0,
         backgroundColor: Colors.white,
         leading: IconButton(
           icon: Icon(MaterialCommunityIcons.arrow_left,color: Colors.black,),
           onPressed: (){
             Navigator.of(context).pop();
           },
         ),
        title: Text("Drafts Videos",style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 16
        ),),
         centerTitle: true,
       ),
       body: Container(
         child: GridView.count(
             crossAxisCount: 3,
           physics: ScrollPhysics(),
           shrinkWrap: true,
           children: <Widget>[
             DraftsVideosItems(),
             DraftsVideosItems(),
             DraftsVideosItems(),
           ],
         ),
       )
     );
  }

}