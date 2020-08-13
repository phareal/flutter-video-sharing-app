


import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';

class SignUpForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _SignUpFormState();
  }
  
}

class _SignUpFormState extends State<SignUpForm>{
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(30,0,30,0),
      child:  Center(
          child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  /*logo*/
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
                  SizedBox(height: 50),
                  /*logo*/
                 Container(
                   height: 55,
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
                   child:  CountryListPick(
                     isShowFlag: true,
                     isShowTitle: true,
                     isShowCode: false,
                     isDownIcon: true,
                     initialSelection: '+91',
                     showEnglishName: true,
                     onChanged: (code) {
                       print(code.name);
                       print(code.code);
                       print(code.dialCode);
                       print(code.flagUri);
                     },
                   ),

                   ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
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
                    child: Row(

                      children: <Widget>[
                        SizedBox(width: 10,),
                        Text("+91", style: GoogleFonts.poppins(),),
                        SizedBox(width: 10,),
                        Container(
                          color: primaryGreyColor,
                          height: 25,
                          width: 1,
                        ),
                        SizedBox(width: 10,),
                         Container(
                              width: 220,
                              child: Center(
                                child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'XX XX XX XX',
                                        border: InputBorder.none
                                    ),
                              )
                              ),
                          )



                      ],
                    )
                    ),
                  SizedBox(height: 30),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("object");

                        Navigator.pushNamed(context, 'otpCode');
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
                            "Next",
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
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      /*first dash*/
                      children: <Widget>[
                        Container(
                          color: primaryGreyColor,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                        SizedBox( width: 20,),
                        Text("Or"),
                        SizedBox( width: 20,),
                        Container(
                          color: primaryGreyColor,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        /*facebook login*/

                        InkWell(
                          onTap:(){
                      print("tapped")     ;
                  },
                          child:   Container(
                            height: 50,
                            width: 50,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent
                            ),
                            child: Container(
                              child: Icon(FontAwesome.facebook,color: Colors.white,),
                            ),
                          ) ,
                        ),
                        SizedBox(width: 40),
                        InkWell(
                          onTap:(){
                            print("tapped")     ;
                          },
                          child:   Container(
                            height: 50,
                            width: 50,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red
                            ),
                            child: Container(
                              child: Icon(FontAwesome.google_plus,color: Colors.white,),
                            ),
                          ) ,
                        )

                      ],
                    ),
                  )



                ],
              )
          )
      ),
    );

  }
  
}