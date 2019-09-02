import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganesh_aarti_app/Home.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: new Duration(seconds: 1),
      vsync: this,
    );

    _animation = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
      curve: Curves.bounceIn,
      parent: _animationController,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double Height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext _context, Widget child) {
        return new Container(
          color: Colors.purple,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 200,
                height: 200,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: new Container(
                  width: 150,
                  height: 150,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(0),
                        child: new Image.asset(
                          'assets/images/bike.png',
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: new Text(
                          'Bikes',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new SizedBox(
                height: 150,
              ),
              new Container(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                width: double.infinity,
                height: 80,
                child: new OutlineButton(
                  borderSide: new BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  child: new Text(
                    'Explore',
                    style: new TextStyle(
                      fontSize: 30,
                      letterSpacing: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new HomePage();
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
