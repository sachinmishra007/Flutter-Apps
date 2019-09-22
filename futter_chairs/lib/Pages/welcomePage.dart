import 'package:flutter/material.dart';
import 'package:futter_chairs/Pages/HomePage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          height: height,
          width: width,
          color: Colors.red,
          child: new Stack(
            children: <Widget>[
              new Container(
                color: new Color(0xff3c5a98),
                height: height * .5,
                width: width,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'Relaxing Chairs',
                      style: new TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              new Positioned(
                bottom: 0,
                child: new Container(
                  width: width,
                  height: height * 0.5,
                  color: Colors.white,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new SizedBox(
                        height: 80,
                      ),
                      new Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: new Text(
                          'Relaxing chairs give you the comfortable and relax day moment for you life.you feel amazed after using it.',
                          style: new TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 2,
                              wordSpacing: 4,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      new OutlineButton(
                        child: new Text(
                          'Explore',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                              builder: (context) {
                                return new HomePage();
                              },
                            ),
                          );
                        },
                        borderSide: new BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Positioned(
                child: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              new Positioned(
                child: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                    height: 180,
                    width: 180,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // new Text(
                        //   'Knowledge',
                        //   style: new TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        new Image.asset(
                          'assets/images/4.png',
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: new Color(0xffEFC849),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
