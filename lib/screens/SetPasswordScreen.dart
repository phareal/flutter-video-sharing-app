import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class SetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SetPasswordScreen();
  }

}


class _SetPasswordScreen extends State<SetPasswordScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            }),
        backgroundColor: primaryBgColor,
        title: Text("Set Password", style:GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400
        ),),
        centerTitle: true,
        elevation: 0,
      ),
    body: Container(
    color: primaryBgColor,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0,0.2,0.8,0]
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/img/logo.png"),height: 50,),
                ],
              ),

            ),
            SizedBox(height: 60),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Form(
                  child:Column(
                    children: <Widget>[
                      Container(
                          height: 50,
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
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                                width: 240,
                                child: Center(
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          border: InputBorder.none,

                                      ),
                                    )
                                ),
                              )

                      ),
                      SizedBox(height: 20),
                      Container(
                          height: 50,
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
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                                width: 240,
                                child: Center(
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintText: 'Confirm password',
                                          border: InputBorder.none,

                                      ),
                                    )
                                ),
                              )

                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            print("object");

                            Navigator.pushNamed(context, 'dashboard');
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(

                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0,0.2,0.8,0]
                                ),
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style:GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
              )
            )
          ],
        ),
    )
    ));
  }

}