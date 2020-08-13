

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:tiktok/helpers/colors.dart';

class OtpCodeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OtpCodeScreenState();
  }
  
}

class _OtpCodeScreenState extends State<OtpCodeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            }),
        backgroundColor: primaryBgColor,
        title: Text("Verify Phone", style:GoogleFonts.poppins(
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
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 50,
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
                Center(
                    child: Text("Enter the verification code we just sent you on your mobile",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ) ,
                    )

                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: PinFieldAutoFill(
                    codeLength: 6,
                    onCodeChanged: (val){
                      print(val);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't Received code?",textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                            ) ,
                          ),
                          SizedBox(width: 10),
                          Text("Resend",textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: primaryPurpleColor
                            ) ,
                          ),
                        ],
                      )
                  ),
                SizedBox(height: 30),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      print("object");

                      Navigator.pushNamed(context, 'setPassword');
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
                            "Verify OTP",
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
          ) ,
        )
      ),
    );
  }
  
}