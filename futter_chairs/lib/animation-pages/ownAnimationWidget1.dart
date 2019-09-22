import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futter_chairs/Pages/common.dart';
import 'package:futter_chairs/common/common.dart';

class OwnAnimationWidget1 extends StatefulWidget {
  @override
  _OwnAnimationWidget1State createState() => _OwnAnimationWidget1State();
}

class _OwnAnimationWidget1State extends State<OwnAnimationWidget1>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationCircle1;
  Animation _animationCircle2;
  Animation _animationLabel1;
  Animation _animationLebel2;
  Animation _animationSkip;

  @override
  void dispose() {
    super.dispose();
  }

  void listener(status) {}

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 2000),
    );
    _animationCircle1 = new Tween(begin: 0.0, end: 0.5).animate(
      new CurvedAnimation(curve: Curves.easeIn, parent: _controller),
    )..addStatusListener(listener);

    _animationCircle2 = new Tween(begin: 0.0, end: 130.0).animate(
      new CurvedAnimation(curve: Curves.easeIn, parent: _controller),
    );

    _animationLabel1 = new Tween(begin: -1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            print('Completed Animation');
          }
        },
      );

    _animationLebel2 = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            print('Completed Animation');
          }
        },
      );

    _animationSkip = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            print('Completed Animation');
          }
        },
      );

    super.initState();
    CommonConstants.changeStatusColor();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return new AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          body: new Container(
            color: CommonConstants.primaryColor,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  // color: Colors.red,
                  width: width,
                  // height: height * _animationCircle1.value,
                  alignment: Alignment.center,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: width - 40,
                        height: height * .5 - 50,
                        // color: Colors.yellowAccent,
                        child: new Container(
                          child: new Stack(
                            children: <Widget>[
                              new Center(
                                child: new Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 200,
                                  decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          new BorderRadius.circular(200)),
                                ),
                              ),
                              new Center(
                                child: new Container(
                                  alignment: Alignment.center,
                                  width: 190,
                                  height: 190,
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          new BorderRadius.circular(190)),
                                ),
                              ),
                              new Center(
                                child: new Image.asset(
                                  'assets/images/5.png',
                                  width: 100,
                                  height: _animationCircle2.value,
                                  alignment: Alignment.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  // color: Colors.greenAccent,
                  width: width,
                  height: height * .5,
                  alignment: Alignment.center,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new SizedBox(
                        height: 80,
                      ),
                      new Transform(
                        transform: Matrix4.translationValues(
                          _animationLabel1.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Align(
                          alignment: Alignment.bottomCenter,
                          child: new Text(
                            'People thoughts',
                            style: new TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 20,
                      ),
                      new Transform(
                        transform: Matrix4.translationValues(
                          _animationLebel2.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Center(
                              child: new Text(
                                'inspire and help each other to know what\'s happing accross the word',
                                style: new TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      new Transform(
                        transform: Matrix4.translationValues(
                            0.0, _animationSkip.value * width, 0.0),
                        child: new Align(
                          alignment: Alignment.bottomCenter,
                          child: new Container(
                            child: new FlatButton(
                              child: new Text(
                                'skip',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return new CommonPage();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
