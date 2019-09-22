import 'package:flutter/material.dart';

class OffsetDelayAnimationWidget extends StatefulWidget {
  @override
  _OffsetDelayAnimationWidget createState() => _OffsetDelayAnimationWidget();
}

class _OffsetDelayAnimationWidget extends State<OffsetDelayAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _lateAnimation;
  Animation _animation2;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    void listener2(status) {
      if (status == AnimationStatus.completed) {
        _animation2.removeStatusListener(listener2);
        _controller.reset();

        _animation2 = new Tween(
          begin: 0.0,
          end: -1.0,
        ).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener((status) {});

        _controller.forward();
      }
    }

    void listener(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(listener);
        _controller.reset();

        _animation = new Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        );

        _lateAnimation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: _controller,
            curve: new Interval(
              0.2,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Navigator.pop(context)
              print('Completed');
              Navigator.of(context).pop();
            }
          });

        _controller.forward();
      }
    }

    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(
        seconds: 2,
      ),
    );

    _animation = new Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(listener);

    _animation2 = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(listener2);

    _lateAnimation = new Tween(begin: -1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // _controller.forward();
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
                            _animation.value * width, 0, 0),
                        child: new Center(
                          child: new Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: new Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      new Transform(
                        transform: Matrix4.translationValues(
                          _animation2.value * width,
                          0,
                          0,
                        ),
                        child: new Center(
                          child: new Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: new Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      new Transform(
                        transform: Matrix4.translationValues(
                          _lateAnimation.value * width,
                          0,
                          0,
                        ),
                        child: new Center(
                          child: new Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: new Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.yellow,
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
        });
  }
}
