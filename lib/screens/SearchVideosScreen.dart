import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/components/DraftsVideoItems.dart';

class SearchVideosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _SearchVideoStateScreen();
  }

}

class _SearchVideoStateScreen extends State<SearchVideosScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Search Videos",style: GoogleFonts.poppins(
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
              margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Row(
                children: <Widget>[
                  Container(
                      width:195,
                      height: 40,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Container(
                        width: 195,
                        child: Center(
                            child: TextField(

                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: -5,vertical: 7),
                                prefixIcon: Icon(MaterialIcons.search),
                                hintText: 'Search by Profile',
                                border: InputBorder.none,

                              ),
                            )
                        ),
                      )

                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      width:190,
                      height: 40,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Container(
                        width: 240,
                        child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(

                                prefixIcon: Icon(MaterialIcons.search),
                                hintText: 'Search by Post',
                                border: InputBorder.none,

                              ),
                            )
                        ),
                      )

                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              alignment: Alignment.topLeft,
              child:  Text("Top Videos",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 15,right: 15),
              child: GridView.count(
                crossAxisCount: 3,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  for(var i = 0 ;i<10;i++)
                    Container(
                      margin: EdgeInsets.only(right: 5,top: 5),
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
              ),
            )
          ],
        ),
      ),
    );
  }

}