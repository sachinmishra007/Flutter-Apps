import 'package:flutter/material.dart';

class MaskingAnimationWidget extends StatefulWidget {
  @override
  _MaskingAnimationWidgetState createState() => _MaskingAnimationWidgetState();
}

class _MaskingAnimationWidgetState extends State<MaskingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _transitionTween;
  Animation<BorderRadius> _borderRadius;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(
        seconds: 2,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pop();
        }
      });

    _transitionTween = new Tween(begin: 50.0, end: 190.0).animate(
      new CurvedAnimation(parent: _controller, curve: Curves.ease),
    );

    _borderRadius = new BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(5.0),
    ).animate(new CurvedAnimation(
      curve: Curves.ease,
      parent: _controller,
    ));

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          body: new Center(
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: new Container(
                    width: 200.0, 
                    height: 200.0,
                    decoration: new BoxDecoration(
                      color: Colors.black12,
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    alignment: Alignment.bottomCenter,
                    width: _transitionTween.value,
                    height: _transitionTween.value,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: _borderRadius.value,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
