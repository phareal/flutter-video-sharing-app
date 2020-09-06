import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/components/DraftsVideoItems.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GalleryStateScreen();
  }

}

class _GalleryStateScreen extends State<GalleryScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to f
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Gallery",style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16
        ),),
        leading: IconButton(
          icon: Icon(AntDesign.arrowleft,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          /*Containe*/
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 10,left: 0,right: 0),
                child: SingleChildScrollView(
                    child: Expanded(child: GridView.count(
                      crossAxisCount: 3,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        for(var i = 0 ;i<10;i++)
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/img/profile.png")
                                )
                            ),
                          )

                      ],
                    ))
                )
            )
          ],
        ),
      ),
    );
  }

}