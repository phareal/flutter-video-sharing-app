import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/helpers/colors.dart';
import 'package:tiktok/screens/BoomerangScreen.dart';
import 'package:tiktok/screens/CloseFriendScreen.dart';
import 'package:tiktok/screens/ConversationScreen.dart';
import 'package:tiktok/screens/Create.dart';
import 'package:tiktok/screens/DashboardScreen.dart';
import 'package:tiktok/screens/DraftVideosScreen.dart';
import 'package:tiktok/screens/EditProfileScreen.dart';
import 'package:tiktok/screens/Gallery.dart';
import 'package:tiktok/screens/MessagesList.dart';
import 'package:tiktok/screens/NotificationsListScreen.dart';
import 'package:tiktok/screens/OtpCodeScreen.dart';
import 'package:tiktok/screens/ProfilePage.dart';
import 'package:tiktok/screens/ScreenForFilters.dart';
import 'package:tiktok/screens/ScreenForVideoEffects.dart';
import 'package:tiktok/screens/SearchVideosScreen.dart';
import 'package:tiktok/screens/SelectBackground.dart';
import 'package:tiktok/screens/SetPasswordScreen.dart';
import 'dart:async';

import 'package:tiktok/screens/SignUp.dart';
import 'package:tiktok/screens/StoryOne.dart';
import 'package:tiktok/screens/components/PhotoViewScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(Main(cameraDescription: cameras,));
}

class Main extends StatelessWidget {
  final List<CameraDescription> cameraDescription;

  const Main({
    Key key,
    @required this.cameraDescription}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ye Wala',
      theme: ThemeData(
        bottomAppBarColor: Colors.black,
        accentColor: Colors.black,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'splash': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'signUp' : (context) => SignUp(),
        'otpCode' : (context) => OtpCodeScreen(),
        'setPassword' : (context) => SetPasswordScreen(),
        'dashboard' : (context) => DashboardScreen(cameraDescription: this.cameraDescription,),
        'profile' : (context) => ProfilePage(),
        'createVideo' : (context) => CreateVideoScreen(cameraDescription: this.cameraDescription,),
        'ForFilters' : (context) => ScreenForFilters(cameraDescriptions: this.cameraDescription),
        'ForVideoFilters' : (context) => ScreenForVideosFilters(),
        'SelectBackground' : (context) => SelectBackgroundScreen(),
        'EditUserProfile' : (context) => EditUserProfile(),
        'MessagesList' : (context) => MessagesListScreen(),
        'NotificationList' : (context) => NotificationsListScreen(),
        'DraftsVideosScreen' : (context) => DraftsVideosScreen(),
        'SearchVideoScreen' : (context) => SearchVideosScreen(),
        'BoomerangScreen' : (context) => BoomerangScreen(),
        'CloseFriendScreen' : (context) => CloseFriendsScreen(cameraDescriptions: this.cameraDescription,),
        'Gallery' : (context) => GalleryScreen(),
        'PhotoView' : (context) => PhotoViewScreen(),
        'StoryOne' : (context) => StoryOneScreen(cameraDescriptions: this.cameraDescription,),
      },
      initialRoute: 'splash',

    );
  }
}

class SplashScreen extends StatefulWidget {



  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _SplashScreenState(){
    Future.delayed(Duration(seconds: 5), () {
      setState((){
        Navigator.pushNamed(context, 'dashboard');
      });
    });
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(

        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryRedColor,primaryPurpleColor,primaryBlueColorDark,primaryBlueColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0,0.2,0.8,0]
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Image(image: AssetImage("assets/img/logo.png"),height: 50,),

                ],
              ),
          )
      ),
    );
  }


}

