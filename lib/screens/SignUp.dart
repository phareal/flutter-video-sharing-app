

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:phone_number/phone_number.dart';
import 'package:tiktok/misc/SignUpForm.dart';



class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }

}


class _SignUpState extends State<SignUp>{
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
          title: Text("Sign Up", style:GoogleFonts.poppins(
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
          child: SignUpForm(),
        ),
      )
    );

  }

}