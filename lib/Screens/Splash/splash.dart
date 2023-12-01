import 'dart:async';
import 'package:homely_driver/Helper/Session.dart';
import 'package:homely_driver/Helper/app_assets.dart';
import 'package:homely_driver/Screens/Authentication/login.dart';
import 'package:homely_driver/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homely_driver/generated/assets.dart';
import '../../Helper/color.dart';
import '../../Helper/string.dart';

//splash screen of app
class Splash extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: back(),
        child: Center(child: Image.asset(Assets.logoSplashLogo,fit: BoxFit.fill,)),
      ),
      // Stack(
      //   children: <Widget>[
      //     Container(
      //       width: double.infinity,
      //       height: double.infinity,
      //       decoration: back(),
      //       child: Center(
      //         child: Container(
      //           color: Colors.white,
      //           height: MediaQuery.of(context).size.height / 7,
      //           padding: EdgeInsets.all(
      //             MediaQuery.of(context).size.height / 60,
      //           ),
      //           child: Image.asset(
      //             // 'assets/images/splashlogo.png',
      //             Myassets.app_logo,
      //             height: MediaQuery.of(context).size.height / 10,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Image.asset(
      //       'assets/images/doodle.png',
      //       fit: BoxFit.fill,
      //       width: double.infinity,
      //       height: double.infinity,
      //     ),
      //   ],
      // ),
    );
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(isLogin);
    if (isFirstTime) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    }
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: black),
      ),
      backgroundColor: white,
      elevation: 1.0,
    ));
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    super.dispose();
  }
}
