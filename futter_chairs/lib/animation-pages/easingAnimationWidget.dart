import 'package:flutter/material.dart';

class EasingAnimationWidget extends StatefulWidget {
  @override
  _EasingAnimationWidgetState createState() => _EasingAnimationWidgetState();
}

class _EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    void listner3(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(listner3);
        _controller.reset();
        _animation = new Tween(begin: 0.0, end: -1.0).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.of(context).pop();
              }
            },
          );
        _controller.forward();
      }
    }

    void listener2(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(listener2);
        _controller.reset();
        _animation = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener(listner3);
        _controller.forward();
      }
    }

    void listener(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(listener);
        _controller.reset();
        _animation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener(listener2);
        _controller.forward();
      }
    }

    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(
        seconds: 1,
      ),
    );

    _animation = new Tween(begin: -1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(listener);

    _controller.forward();
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return new AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return new Scaffold(
          body: new Transform(
            transform:
                Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
            child: new Center(
              child: new Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
