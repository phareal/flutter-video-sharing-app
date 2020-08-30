import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/components/ConversationBubble.dart';

class ConversationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return _ConversationScreenState();
  }

}

class _ConversationScreenState extends State<ConversationScreen>{
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         bottom: PreferredSize(
             child: Container(
               color: Colors.grey[200],
               height: 1.0,
             ),
             preferredSize: Size.fromHeight(1.0)),
         elevation: 0.0,
         backgroundColor: Colors.white,
         leading: IconButton(
           icon: Icon(MaterialCommunityIcons.arrow_left,color: Colors.black,),
           onPressed: (){
             Navigator.of(context).pop();
           },
         ),
         title: Text("Vishal",style: GoogleFonts.poppins(
             color: Colors.black, fontSize: 16
         ),),
         centerTitle: true,
         actions: <Widget>[
           IconButton(
             icon: Icon(MaterialIcons.search,color: Colors.black,),
             onPressed: (){
               Navigator.of(context).pop();
             },
           ),
         ],
       ),
       body: Stack(
         children: <Widget>[
           Container(
             color: Colors.white,
             child: Column(
               children: <Widget>[
                 Flexible(
                   child: ListView.builder(
                     itemCount: 1,
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context, int index) {
                       return Padding(
                         padding: EdgeInsets.all(10),
                         child: Column(
                           children: <Widget>[
                             Text(
                               'Today',
                               style:
                               TextStyle(color: Colors.grey, fontSize: 12),
                             ),
                             ConversationBubble(
                               message: 'Hi How are you ?',
                               isMe: true,
                             ),
                             ConversationBubble(
                               message: 'have you seen the docs yet?',
                               isMe: true,
                             ),
                             Text(
                               'Feb 25, 2018',
                               style:
                               TextStyle(color: Colors.grey, fontSize: 12),
                             ),
                             ConversationBubble(
                               message: 'i am fine !',
                               isMe: false,
                             ),
                             ConversationBubble(
                               message: 'yes i\'ve seen the docs',
                               isMe: false,
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
           Positioned(
             bottom: 0,
             left: 0,
             width: MediaQuery.of(context).size.width,
             child: Container(
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(color: Colors.white, boxShadow: [
                 BoxShadow(
                   color: Colors.grey[300],
                   offset: Offset(-2, 0),
                   blurRadius: 5,
                 ),
               ]),
               child: Row(
                 children: <Widget>[
                   IconButton(
                     onPressed: () {},
                     icon: Icon(
                       Icons.add,
                       color: Colors.black,
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 15),
                   ),
                   Expanded(
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                         hintText: 'Write a message',
                         border: InputBorder.none,
                       ),
                     ),
                   ),
                   IconButton(
                     onPressed: () {},
                     icon: Icon(
                       Icons.send,
                       color: Colors.black,
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
     );
  }
}
