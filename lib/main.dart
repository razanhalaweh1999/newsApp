import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/Home_view.dart';
import 'package:news_app/view/splash_screen.dart';


main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "news App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //  primaryColor: redColor,
          accentColor: Colors.grey.shade200,
          //backgroundColor:pinkColor,
          fontFamily: "DancingScript-Regular"
      ),
      home: SplashScreen(),
    );
  }
}
