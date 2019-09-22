import 'package:flutter/material.dart';
import 'package:futter_chairs/Pages/animationPage.dart';
import 'package:futter_chairs/Pages/welcomePage.dart';
import 'package:futter_chairs/common/common.dart';

class CommonPage extends StatefulWidget {
  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _twinAnim;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1500),
    );

    _twinAnim = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
    CommonConstants.changeStatusColor();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: CommonConstants.primaryColor,
        title: new Text(
          'Flutter Explore Area',
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Container(
        width: width,
        height: height,
        color: CommonConstants.secondaryColor,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 5,
                bottom: 5,
              ),
              child: new Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  'Flutter ways to explore things...',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            new Container(
              width: width - 20,
              decoration: new BoxDecoration(
                  // boxShadow: [
                  //   new BoxShadow(
                  //     color: Colors.yellow,
                  //     blurRadius: 5.0,
                  //   ),
                  // ],
                  ),
              child: new Card(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(
                  15,
                )),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new SizedBox(
                      height: 150.0,
                      width: width - 50,
                      child: new Stack(
                        children: <Widget>[
                          new Positioned(
                            top: 50,
                            left: 0,
                            child: new FadeInImage.assetNetwork(
                              fadeInCurve: Curves.easeIn,
                              placeholder: 'assets/images/6.png',
                              fit: BoxFit.cover,
                              width: 100.0,
                              height: 100.0,
                              image:
                                  'https://secure.img2-fg.wfcdn.com/im/10140619/compr-r85/3730/37304938/default_name.png',
                            ),
                          ),
                          new Positioned(
                            left: 110,
                            top: 20,
                            child: new FittedBox(
                              fit: BoxFit.scaleDown,
                              child: new Opacity(
                                opacity: _twinAnim.value,
                                child: new Text(
                                  'Chair Collections',
                                  textAlign: TextAlign.justify,
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Positioned(
                            left: 110,
                            top: 60,
                            child: new LimitedBox(
                              maxWidth: width - 160,
                              child: new Text(
                                'This is the new music chair app collection.'
                                'Please click on the explore button'
                                'in case would like to see more',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                textAlign: TextAlign.justify,
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new ButtonTheme.bar(
                      child: new ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new FlatButton(
                            child: new Text(
                              'Explore',
                              style: new TextStyle(
                                  color: new Color(0xff4a148c),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return new WelcomePage();
                              }));
                            },
                          ),
                          new FlatButton(
                            child: new Text(
                              'Share',
                              style: new TextStyle(
                                  color: new Color(0xff4a148c),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            new SizedBox(
              height: 10,
            ),
            new Container(
              width: width - 20,
              decoration: new BoxDecoration(
                  // boxShadow: [
                  //   new BoxShadow(
                  //     color: Colors.yellow,
                  //     blurRadius: 5.0,
                  //   ),
                  // ],
                  ),
              child: new Card(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(
                  15,
                )),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new SizedBox(
                      height: 150.0,
                      width: width - 50,
                      child: new Stack(
                        children: <Widget>[
                          new Positioned(
                            top: 50,
                            left: 0,
                            child: new FadeInImage.assetNetwork(
                              fadeInCurve: Curves.easeIn,
                              placeholder: 'assets/images/6.png',
                              fit: BoxFit.cover,
                              width: 100.0,
                              height: 100.0,
                              image:
                                  'https://www.arena-multimedia.com/uploads/course_images/animation.png',
                            ),
                          ),
                          new Positioned(
                            left: 110,
                            top: 20,
                            child: new FittedBox(
                              fit: BoxFit.scaleDown,
                              child: new Opacity(
                                opacity: _twinAnim.value,
                                child: new Text(
                                  'Flutter Animation',
                                  textAlign: TextAlign.justify,
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Positioned(
                            left: 110,
                            top: 60,
                            child: new LimitedBox(
                              maxWidth: width - 160,
                              child: new Text(
                                'This is collection of flutter animations'
                                'the example is basically consits of available &'
                                'implemented various options flutter.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                textAlign: TextAlign.justify,
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new ButtonTheme.bar(
                      child: new ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new FlatButton(
                            child: new Text(
                              'Explore',
                              style: new TextStyle(
                                  color: new Color(0xff4a148c),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return new AnimationLearningPage();
                              }));
                            },
                          ),
                          new FlatButton(
                            child: new Text(
                              'Share',
                              style: new TextStyle(
                                  color: new Color(0xff4a148c),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
