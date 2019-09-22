import 'package:flutter/material.dart';

class TransformationAnimationWidget extends StatefulWidget {
  @override
  _TransformationAnimationWidgetState createState() =>
      _TransformationAnimationWidgetState();
}

class _TransformationAnimationWidgetState
    extends State<TransformationAnimationWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _transitionTween;
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
      duration: new Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          Navigator.of(context).pop();
        }
      });

    _transitionTween = new Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    _borderRadius = new BorderRadiusTween(
      begin: new BorderRadius.circular(75.0),
      end: new BorderRadius.circular(0.0),
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    super.initState();
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
          body: new Center(
            child: new Container(
              alignment: Alignment.bottomCenter,
              width: _transitionTween.value,
              height:  _transitionTween.value,
              decoration: new BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: _borderRadius.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
