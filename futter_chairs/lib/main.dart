import 'package:flutter/material.dart';
import 'package:futter_chairs/animation-pages/ownAnimationWidget1.dart';
import 'package:futter_chairs/common/common.dart';

// import 'Pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relaxing Chairs',
      color: CommonConstants.primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Slabo'),
      home: OwnAnimationWidget1(), //AnimationLearningPage(),
    );
  }
}
