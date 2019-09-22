import 'package:flutter/material.dart';

class ParetingAnimationWidget extends StatefulWidget {
  @override
  _ParetingAnimationWidgetState createState() =>
      _ParetingAnimationWidgetState();
}

class _ParetingAnimationWidgetState extends State<ParetingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _growingAnimation;
  Animation animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    void listener(status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    }

    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );

    _growingAnimation = new Tween(
      begin: 10.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    animation = new Tween(
      begin: -0.25,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener(listener);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          body: new Align(
            alignment: Alignment.center,
            child: new Container(
              child: new Center(
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Transform(
                      transform: Matrix4.translationValues(
                        animation.value * width,
                        0,
                        0,
                      ),
                      child: new Center(
                        child: new Container(
                          height: _growingAnimation.value,
                          width: _growingAnimation.value * 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    new Transform(
                      transform: Matrix4.translationValues(
                        animation.value * width,
                        0.0,
                        0.0,
                      ),
                      child: new Center(
                        child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: new Container(
                            width: _growingAnimation.value * 2,
                            height: _growingAnimation.value,
                            color: Colors.tealAccent,
                          ),
                        ),
                      ),
                    ),
                    new Transform(
                      transform: Matrix4.translationValues(
                        animation.value * width,
                        0.0,
                        0.0,
                      ),
                      child: new Center(
                        child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: new Container(
                            width: _growingAnimation.value * 2,
                            height: _growingAnimation.value,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
