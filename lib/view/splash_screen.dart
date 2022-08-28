
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/view/Home_view.dart';


class SplashScreen extends StatefulWidget {



  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  read() async {


    //print(sharedPreferences.getBool('loggedInTrue'));
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new HomeView(),
          )
      );
  }


  bool isAuth = false;
  @override
   initState() {

    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      read();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    //  backgroundColor: Color(0xff890f0f),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset("images/splash.json"),
            SizedBox(height: 200,),
            Text("News App",style: TextStyle(fontSize: 20,letterSpacing: 7,color:  Color(0xff700303), fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
