import 'package:flutter/material.dart';

class ValueChangeAnimationWidget extends StatefulWidget {
  @override
  _ValueChangeAnimationWidgetState createState() =>
      _ValueChangeAnimationWidgetState();
}

class _ValueChangeAnimationWidgetState extends State<ValueChangeAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );

    _animation = new IntTween(begin: 0, end: 10).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            Navigator.of(context).pop();
          }
        },
      );

    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          body: new Center(
            child: new Text(
              _animation.value.toString(),
              style: new TextStyle(
                fontSize: 48.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
